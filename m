Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A26281D902D
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 08:37:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D3833C4E64
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 08:37:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id C10A63C1ABA
 for <ltp@lists.linux.it>; Tue, 19 May 2020 08:37:44 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 411F81000AF6
 for <ltp@lists.linux.it>; Tue, 19 May 2020 08:37:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 67539AC5B;
 Tue, 19 May 2020 06:37:45 +0000 (UTC)
Date: Tue, 19 May 2020 08:37:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20200519063740.GA7756@dell5510>
References: <20200518130132.19312-1-pvorel@suse.cz>
 <1a41aca6-f774-08da-bf7b-b33806b48923@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a41aca6-f774-08da-bf7b-b33806b48923@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] tst_test.sh: Fix calling not yet loaded
 cleanup function
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi J=F6rg,

> >   	TST_DO_EXIT=3D1
> > -	if [ -n "$TST_CLEANUP" -a -z "$TST_NO_CLEANUP" ]; then
> > +	if [ -n "$TST_SETUP_STARTED" -a -n "$TST_RUN_STARTED" -a \
> > +		-n "$TST_CLEANUP" -a -z "$TST_NO_CLEANUP" ]; then
> In the description you write "[after] running either setup or test
> function". But this implementation
> is "after running setup and test function". Cleanup should also be execut=
ed,
> if only setup was run right?
Thanks! Yes, I meant -o (or), but typed -a (and).

> > @@ -592,9 +594,11 @@ tst_run()
> >   			_tst_max=3D$(( $(echo $TST_TEST_DATA | tr -cd "$TST_TEST_DATA_IFS"=
 | wc -c) +1))
> >   			for _tst_i in $(seq $_tst_max); do
> >   				_tst_data=3D"$(echo "$TST_TEST_DATA" | cut -d"$TST_TEST_DATA_IFS"=
 -f$_tst_i)"
> > +				TST_RUN_STARTED=3D1
> >   				_tst_run_tests "$_tst_data"
> >   			done
> >   		else
> > +			TST_RUN_STARTED=3D1
> >   			_tst_run_tests
> >   		fi
> Is it really important, that test is started? Shouldn't it be enough if we
> got to the point, where the test
> could be started. Moving TST_RUN_STARTED out of the condition would reduce
> repetition.

Well, if you look into the code, there is tst_require_cmds call in if claus=
e,
which should pass:

	#TODO check that test reports some results for each test function call
	while [ $TST_ITERATIONS -gt 0 ]; do
		if [ -n "$TST_TEST_DATA" ]; then
			tst_require_cmds cut tr wc
			_tst_max=3D$(( $(echo $TST_TEST_DATA | tr -cd "$TST_TEST_DATA_IFS" | wc =
-c) +1))
			for _tst_i in $(seq $_tst_max); do
				_tst_data=3D"$(echo "$TST_TEST_DATA" | cut -d"$TST_TEST_DATA_IFS" -f$_t=
st_i)"
				TST_RUN_STARTED=3D1
				_tst_run_tests "$_tst_data"
			done
		else
			TST_RUN_STARTED=3D1
			_tst_run_tests
		fi
		TST_ITERATIONS=3D$((TST_ITERATIONS-1))
	done

Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
