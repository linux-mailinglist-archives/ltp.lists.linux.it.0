Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 683D71D9039
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 08:45:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 16FF43C4E64
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 08:45:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 960CE3C1ABA
 for <ltp@lists.linux.it>; Tue, 19 May 2020 08:44:59 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3246F6022BF
 for <ltp@lists.linux.it>; Tue, 19 May 2020 08:44:57 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.1.13])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 35AB59F7ED;
 Tue, 19 May 2020 06:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1589870696; bh=2yNHfWb7hQEK4oaBueNnNu8I8Vv13rnrm7RcrXkeWHU=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=nQuWPqTVJMi94y0Rr0//Xpjoqok5W4THdsmh5L9hj8qDz7dBPkfPoVO6zrTbv/Rt0
 KlKMqCSvOF98FU4n6QdkcLCW0Kxu+CB1crs6S1DELmZTpd4AhWq+Pp0rBO13OC5RnJ
 LlRi3WorRm6uyEoZ7jky/ioFVr8Zjk4WR6cPGwh0=
To: Petr Vorel <pvorel@suse.cz>
References: <20200518130132.19312-1-pvorel@suse.cz>
 <1a41aca6-f774-08da-bf7b-b33806b48923@jv-coder.de>
 <20200519063740.GA7756@dell5510>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <eb30b7e2-fb61-cdcb-b24b-6deb5512f4a4@jv-coder.de>
Date: Tue, 19 May 2020 08:44:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519063740.GA7756@dell5510>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-2"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

>> Is it really important, that test is started? Shouldn't it be enough if =
we
>> got to the point, where the test
>> could be started. Moving TST_RUN_STARTED out of the condition would redu=
ce
>> repetition.
> Well, if you look into the code, there is tst_require_cmds call in if cla=
use,
> which should pass:
>
> 	#TODO check that test reports some results for each test function call
> 	while [ $TST_ITERATIONS -gt 0 ]; do
> 		if [ -n "$TST_TEST_DATA" ]; then
> 			tst_require_cmds cut tr wc
> 			_tst_max=3D$(( $(echo $TST_TEST_DATA | tr -cd "$TST_TEST_DATA_IFS" | w=
c -c) +1))
> 			for _tst_i in $(seq $_tst_max); do
> 				_tst_data=3D"$(echo "$TST_TEST_DATA" | cut -d"$TST_TEST_DATA_IFS" -f$=
_tst_i)"
> 				TST_RUN_STARTED=3D1
> 				_tst_run_tests "$_tst_data"
> 			done
> 		else
> 			TST_RUN_STARTED=3D1
> 			_tst_run_tests
> 		fi
> 		TST_ITERATIONS=3D$((TST_ITERATIONS-1))
> 	done

At this point setup was executed right? So if tst_require_cmds fails, it =

should execute cleanup, to
revert whatever setup did, no?
Oh I guess changing the condition to "setup run _or_ test run" will make =

this work.
But is there really a reason for having both variables? I guess the =

reason they exist at all is to ensure,
that the cleanup function is already defined. But that should be true, =

as soon as tst_run is executed.
So maybe one single variable that is set, when TST_RUN is executed is =

sufficient.
In my opinion the decision to execute of cleanup shouldn't be too =

complicated. The cleanup function
should be able to handle an abort anytime during test execution anyway. =

So it should be callable, as soon
as it is defined. At least when tst_run is executed, it should be ok to =

call cleanup.

J=F6rg

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
