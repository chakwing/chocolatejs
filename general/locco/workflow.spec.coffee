unless window?
    Workflow = require '../../general/locco/workflow'
    
    librarySpace =
        Categories:
            Science:
                Collections:
                    Mathematics:
                        Books:
                            'Thinking, Fast and Slow':
                                author: 'Daniel Kahneman'
                                publisher: 'Farrar, Straus and Giroux; Reprint edition'
                                date: 'April 2, 2013' 
                            'Our Mathematical Universe: My Quest for the Ultimate Nature of Reality':
                                author: 'Max Tegmark'
                                publisher: 'Knopf'
                                date: 'January 7, 2014'
                    Physics:
                        Books:
                            'Einstein and the Quantum: The Quest of the Valiant Swabian':
                                author: 'A. Douglas Stone'
                                publisher: 'Princeton University Press'
                                date: 'October 6, 2013'
                            'The Theoretical Minimum: What You Need to Know to Start Doing Physics':
                                author: 'Leonard Susskind'
                                publisher: 'Basic Books'
                                date: 'January 29, 2013'
                                
            Literature:
                Collections:
                    French:
                        Books:
                            'L\'étranger':
                                auhtor:'Albert Camus'
                                publisher: 'Gallimard'
                                date: 'December 1, 1971'
                            'Du Cote de Chez Swann':
                                author:'Marcel Proust'
                                Publisher: 'Gallimard Education'
                                date: 'March 1, 1988'
                    German:
                        Books:
                            'Das Schloß':
                                auhtor:'Franz Kafka'
                                Publisher: 'CreateSpace Independent Publishing Platform'
                                date: 'February 20, 2013'
            History:
                Collections:
                    '17th century':
                        Books:
                            'In Fine Style: The Art of Tudor and Stuart Fashion':
                                author:'Anna Reynolds'
                                publisher: 'Royal Collection Trust'
                                date: 'June 15, 2013'
                            'The Clockwork Universe: Isaac Newton, the Royal Society, and the Birth of the Modern World':
                                author: 'Edward Dolnick'
                                publisher: 'Harper Perennial; Reprint edition'
                                date: 'February 7, 2012'
                    '18th century':
                        Books:
                            'Wellington: The Path to Victory 1769-1814':
                                auhtor: 'Rory Muir'
                                publisher: 'Yale University Press'
                                date: 'December 3, 2013'
                            'The Age of Revolution: 1789-1848':
                                author: 'Eric Hobsbawm'
                                publisher: 'Vintage; 1st Vintage Books ed edition'
                                date: 'November 26, 1996'
                    '19th century':
                        Books:
                            'Killing Lincoln: The Shocking Assassination that Changed America Forever':
                                author:'Bill O\'Reilly'
                                publisher: 'Henry Holt and Co.; 1 edition'
                                date: 'September 27, 2011'
                            'Gettysburg: The Last Invasion':
                                auhtor: 'Allen C. Guelzo'
                                publisher: 'Knopf'
                                date: 'May 14, 2013'
                            'Napoleon: A Political Life':
                                author: 'Steven Englund'
                                publisher: 'Harvard niversity Press'
                                date: 'May 30, 2005'
            
    describe 'Workflow', ->
        describe 'Action', ->
            Action = Workflow.Action
            action = undefined
            
            it 'should create a Action', ->
                expect(action = new Action()).not.toBeUndefined()
            
            it 'should get back full libray', ->
                action.go 'Categories', action.go.Where.Inside
                expect(action.actions.length).toBe(1)
