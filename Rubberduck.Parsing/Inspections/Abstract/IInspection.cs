﻿using System;
using System.Collections.Generic;
using System.Threading;
using Rubberduck.VBEditor;

namespace Rubberduck.Parsing.Inspections.Abstract
{
    /// <summary>
    /// An interface that abstracts a runnable code inspection.
    /// </summary>
    public interface IInspection : IInspectionModel, IComparable<IInspection>, IComparable
    {
        /// <summary>
        /// Runs code inspection and returns inspection results.
        /// </summary>
        /// <param name="token"></param>
        /// <returns>Returns inspection results, if any.</returns>
        IEnumerable<IInspectionResult> GetInspectionResults(CancellationToken token);

        /// <summary>
        /// Specifies whether an inspection result is deemed invalid after the specified modules have changed.
        /// </summary>
        bool ChangesInvalidateResult(IInspectionResult result, ICollection<QualifiedModuleName> modifiedModules);
    }
}
