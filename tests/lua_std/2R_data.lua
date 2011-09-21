require "synthesis"

function gen_syn ()

   local ko = kin_object.new( "chain" )
   local j = kin_joint.new( "revolute" )
   j:setPlucker( { 1.008096801612704263e-01, 4.052548873893188075e-01, 9.086285735287289445e-01 }, { 2.895556750737735996e+00, 1.517734523006856739e-01, -3.889455972961509689e-01 } ) -- dot=0.000e+00
   j:setPositions( { 3.6795790357616, 1.7492484068476 } )
   --j:setConstS(true)
   ko:attach( j )
   local j = kin_joint.new( "revolute" )
   j:setPlucker( { 1.241875533256507902e-01, 6.149905141674485431e-01, 7.786938545301649306e-01 }, { -1.603624904450287492e+00, -6.284981705682829656e+00, 5.219450956754929649e+00 } ) -- dot=0.000e+00
   j:setPositions( { 2.2255361290424, 4.8574811834511 } )
   --j:setConstS(true)
   ko:attach( j )

   local tcp = kin_object.new( "tcp" )
   tcp:setFK( {
      -- Frame 1
      { { 1.000000000000000000e+00, 0.000000000000000000e+00, 0.000000000000000000e+00, 2.049065917276094231e-02 },
        { 0.000000000000000000e+00, 1.000000000000000000e+00, 0.000000000000000000e+00, 1.129614548089358655e-01 },
        { 0.000000000000000000e+00, 0.000000000000000000e+00, 1.000000000000000000e+00, 6.139304695217708829e-01 },
        { 0., 0., 0., 1. } },
      -- Frame 2
      { { 9.040394899940082940e-01, 3.828147684558789177e-01, -1.901721682671921321e-01, -1.649011914540019674e+01 },
        { -4.268123595723317676e-01, 8.327058160501530359e-01, -3.527495338516368206e-01, 7.908792819459817380e+00 },
        { 2.331973944262567822e-02, 4.000673405419647444e-01, 9.161890158608143597e-01, 1.037512275044799370e+00 },
        { 0., 0., 0., 1. } },
      -- Frame 3
      { { 9.207712338506529592e-01, -3.891350965087299607e-01, -2.746291277864693070e-02, -5.367129050895705689e+00 },
        { 3.686174678681981010e-01, 8.909406911238723081e-01, -2.652279157293862544e-01, 9.671319963725069968e+00 },
        { 1.276773170754463560e-01, 2.340909258490339873e-01, 9.637945533875763582e-01, -5.119781995378792416e+00 },
        { 0., 0., 0., 1. } }
      } )
   ko:attach( tcp )

   local s = syn.new( 3 )
   s:addObject( ko )
   s:finalize()
   return s

end

