﻿using System.Collections.Generic;
using System.Linq;
using System.Threading;
using NUnit.Framework;
using Rubberduck.Inspections.Concrete;
using Rubberduck.Parsing.Inspections.Abstract;
using RubberduckTests.Mocks;

namespace RubberduckTests.Inspections
{
    [TestFixture]
    public class MissingAttributeInspectionTests
    {
        [Test]
        [Category("Inspections")]
        public void NoAnnotation_NoResult()
        {
            const string inputCode =
                @"Public Sub Foo()
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.IsFalse(inspectionResults.Any());
        }

        [Test]
        [Category("Inspections")]
        public void ModuleAttributeAnnotationWithoutAttributeReturnsResult()
        {
            const string inputCode =
                @"'@ModuleAttribute VB_Description, ""Desc""
Public Sub Foo()
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.AreEqual(1, inspectionResults.Count());
        }

        [Test]
        [Category("Inspections")]
        public void ModuleAttributeAnnotationWithAttributeReturnsNoResult()
        {
            const string inputCode =
                @"Attribute VB_Description = ""NotDesc""
'@ModuleAttribute VB_Description, ""Desc""
Public Sub Foo()
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.IsFalse(inspectionResults.Any());
        }

        [Test]
        [Category("Inspections")]
        public void VbExtKeyModuleAttributeAnnotationWithAttributeButWithoutKeyReturnsResult()
        {
            const string inputCode =
                @"Attribute VB_Ext_Key = ""OtherKey"", ""Value""
'@ModuleAttribute VB_Ext_Key, ""Key"", ""Value""
Public Sub Foo()
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.AreEqual(1, inspectionResults.Count());
        }

        [Test]
        [Category("Inspections")]
        public void VbExtKeyModuleAttributeAnnotationWithAttributeAndKeyReturnsNoResult()
        {
            const string inputCode =
                @"Attribute VB_Ext_Key = ""Key"", ""OtherValue""
'@ModuleAttribute VB_Ext_Key, ""Key"", ""Value""
Public Sub Foo()
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.IsFalse(inspectionResults.Any());
        }

        [Test]
        [Category("Inspections")]
        public void ModuleAttributeAnnotationWithMissingArgumentsNoResult()
        {
            const string inputCode =
                @"'@ModuleAttribute
Public Sub Foo()
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.IsFalse(inspectionResults.Any());
        }

        [Test]
        [Category("Inspections")]
        public void MemberAttributeAnnotationWithoutAttributeReturnsResult()
        {
            const string inputCode =
                @"'@MemberAttribute VB_Description, ""Desc""
Public Sub Foo()
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.AreEqual(1, inspectionResults.Count());
        }

        [Test]
        [Category("Inspections")]
        public void MemberAttributeAnnotationWithAttributeReturnsNoResult()
        {
            const string inputCode =
                @"'@MemberAttribute VB_Description, ""Desc""
Public Sub Foo()
Attribute Foo.VB_Description = ""NotDesc""
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.IsFalse(inspectionResults.Any());
        }

        [Test]
        [Category("Inspections")]
        public void VbExtKeyMemberAttributeAnnotationWithAttributeButWithoutKeyReturnsResult()
        {
            const string inputCode =
                @"'@MemberAttribute VB_Ext_Key, ""Key"", ""Value""
Public Sub Foo()
Attribute Foo.VB_Ext_Key = ""OtherKey"", ""Value""
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.AreEqual(1, inspectionResults.Count());
        }

        [Test]
        [Category("Inspections")]
        public void VbExtKeyMemberAttributeAnnotationWithAttributeAndKeyReturnsNoResult()
        {
            const string inputCode =
                @"'@MemberAttribute VB_Ext_Key, ""Key"", ""Value""
Public Sub Foo()
Attribute Foo.VB_Ext_Key = ""Key"", ""OtherValue""
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.IsFalse(inspectionResults.Any());
        }

        [Test]
        [Category("Inspections")]
        public void MemberAttributeAnnotationWithMissingArgumentsNoResult()
        {
            const string inputCode =
                @"'@MemberAttribute
Public Sub Foo()
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.IsFalse(inspectionResults.Any());
        }

        [Test]
        [Category("Inspections")]
        public void DefaultMemberAnnotationWithoutAttributeReturnsResult()
        {
            const string inputCode =
                @"'@DefaultMember
Public Sub Foo()
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.AreEqual(1, inspectionResults.Count());
        }

        [Test]
        [Category("Inspections")]
        public void DefaultMemberAnnotationWithAttributeReturnsNoResult()
        {
            const string inputCode =
                @"'@DefaultMember
Public Sub Foo()
Attribute Foo.VB_UserMemId = 42
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.IsFalse(inspectionResults.Any());
        }

        [Test]
        [Category("Inspections")]
        public void EnumeratorAnnotationWithoutAttributeReturnsResult()
        {
            const string inputCode =
                @"'@Enumerator
Public Sub Foo()
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.AreEqual(1, inspectionResults.Count());
        }

        [Test]
        [Category("Inspections")]
        public void EnumeratorAnnotationWithAttributeReturnsNoResult()
        {
            const string inputCode =
                @"'@Enumerator
Public Sub Foo()
Attribute Foo.VB_UserMemId = 42
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.IsFalse(inspectionResults.Any());
        }

        [Test]
        [Category("Inspections")]
        public void DescriptionAnnotationWithoutAttributeReturnsResult()
        {
            const string inputCode =
                @"'@Description ""Desc""
Public Sub Foo()
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.AreEqual(1, inspectionResults.Count());
        }

        [Test]
        [Category("Inspections")]
        public void DescriptionAnnotationWithAttributeReturnsNoResult()
        {
            const string inputCode =
                @"'@Description, ""Desc""
Public Sub Foo()
Attribute Foo.VB_Description = ""NotDesc""
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.IsFalse(inspectionResults.Any());
        }

        [Test]
        [Category("Inspections")]
        public void ModuleDescriptionAnnotationWithoutAttributeReturnsResult()
        {
            const string inputCode =
                @"'@ModuleDescription ""Desc""
Public Sub Foo()
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.AreEqual(1, inspectionResults.Count());
        }

        [Test]
        [Category("Inspections")]
        public void ModuleDescriptionAnnotationWithAttributeReturnsNoResult()
        {
            const string inputCode =
                @"Attribute VB_Description = ""NotDesc""
'@ModuleDescription ""Desc""
Public Sub Foo()
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.IsFalse(inspectionResults.Any());
        }

        [Test]
        [Category("Inspections")]
        public void PredeclaredIdAnnotationWithoutAttributeReturnsResult()
        {
            const string inputCode =
                @"'@PredeclaredId
Public Sub Foo()
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.AreEqual(1, inspectionResults.Count());
        }

        [Test]
        [Category("Inspections")]
        public void PredeclaredIdAnnotationWithAttributeReturnsNoResult()
        {
            const string inputCode =
                @"Attribute VB_PredeclaredId = False
'@PredeclaredId
Public Sub Foo()
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.IsFalse(inspectionResults.Any());
        }

        [Test]
        [Category("Inspections")]
        public void ExposedAnnotationWithoutAttributeReturnsResult()
        {
            const string inputCode =
                @"'@Exposed
Public Sub Foo()
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.AreEqual(1, inspectionResults.Count());
        }

        [Test]
        [Category("Inspections")]
        public void ExposedAnnotationWithAttributeReturnsNoResult()
        {
            const string inputCode =
                @"Attribute VB_Exposed = False
'@Exposed
Public Sub Foo()
    Const const1 As Integer = 9
End Sub";

            var inspectionResults = InspectionResults(inputCode);
            Assert.IsFalse(inspectionResults.Any());
        }


        private IEnumerable<IInspectionResult> InspectionResults(string inputCode)
        {
            var vbe = MockVbeBuilder.BuildFromSingleStandardModule(inputCode, out _);
            using (var state = MockParser.CreateAndParse(vbe.Object))
            {
                var inspection = new MissingAttributeInspection(state);
                return inspection.GetInspectionResults(CancellationToken.None);
            }
        }
    }
}