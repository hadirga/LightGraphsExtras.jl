# Method when the algorithm used is the Multilink Attack algorithm
function adaptive_arc(
  flow_graph::DiGraph,                           # the input graph
  source::Int,                                   # the source vertex
  target::Int,                                   # the target vertex
  capacity_matrix::AbstractArray{T, 2},          # edge flow capacities
  attacks::Int,                                  # argument for attacks
  algorithm::MultilinkAttackAlgorithm,           # argument for algorithm
  solver::AbstractMathProgSolver,                # argument for solver (unused)
  rtol::T,                                       # absolute tolerance (unused)
  atol::T,                                       # relative tolerance (unused)
  time_limit::Float64                            # time limit (seconds) (unused)
  ) where {T<:AbstractFloat}
  return multilink_attack(flow_graph, source, target, capacity_matrix, attacks)
end

# Method when the algorithm used is a Bilevel Mixed Integer Linear Program
function adaptive_arc(
  flow_graph::DiGraph,                           # the input graph
  source::Int,                                   # the source vertex
  target::Int,                                   # the target vertex
  capacity_matrix::AbstractArray{T, 2},          # edge flow capacities
  attacks::Int,                                  # argument for attacks
  algorithm::BilevelMixedIntegerLinearProgram,   # argument for algorithm
  solver::AbstractMathProgSolver,                # argument for solver
  rtol::T,                                       # absolute tolerance
  atol::T,                                       # relative tolerance
  time_limit::Float64                            # time limit (seconds)
  ) where {T<:AbstractFloat}
  return bilevel_adaptive_arc(flow_graph, source, target, capacity_matrix,
                                  attacks, solver, rtol, atol, time_limit)
end
