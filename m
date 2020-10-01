Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3AC27FA38
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Oct 2020 09:26:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F1C323C4BE3
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Oct 2020 09:26:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id AA9963C223B
 for <ltp@lists.linux.it>; Thu,  1 Oct 2020 09:26:40 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2C8FF1000A12
 for <ltp@lists.linux.it>; Thu,  1 Oct 2020 09:26:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0AD74ACD8;
 Thu,  1 Oct 2020 07:26:39 +0000 (UTC)
Date: Thu, 1 Oct 2020 09:26:37 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20201001072637.GA32109@dell5510>
References: <20200930160214.29358-1-pvorel@suse.cz>
 <20200930160214.29358-5-pvorel@suse.cz>
 <b10815a3a0abade8ec8872757ab5ac2a4f7839f4.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b10815a3a0abade8ec8872757ab5ac2a4f7839f4.camel@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 SUSPICIOUS_RECIPS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/4] ima_tpm.sh: Fix calculating PCR aggregate
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Mimi,

> <snip>

> > +get_pcr10_aggregate()
> > +{
> > +	local params pcr
> > +	local msg="$ERRMSG_EVMCTL"
> > +	local res=TCONF
> > +
> > +	if [ -z "$MISSING_EVMCTL" ]; then
> > +		params="--ignore-violations"  <=== 

> Violations should cause the measurement list verification to fail.
I didn't get this one. the idea is: TCONF for old evmctl version (failure can be
caused by old version, but TFAIL for new version).

> > +		msg=
> > +		res=TFAIL
> > +	elif check_ima_policy_cmdline "tcb"; then
> > +		tst_res TCONF "using builtin IMA TCB policy $ERRMSG_EVMCTL"
> > +		return
> > +	fi
> > +
> > +	evmctl -v ima_measurement $params $BINARY_MEASUREMENTS > hash.txt 2>&1
> > +	if [ $? -ne 0 -a -z "$MISSING_EVMCTL" ]; then
> > +		tst_res TFAIL "evmctl failed $ERRMSG_EVMCTL"
> > +		tst_res TINFO "hash file:"
> > +		cat hash.txt >&2
> > +		return
> > +	fi
> > +
> > +	pcr=$(grep -E "^($ALGORITHM: )*PCRAgg.*:" hash.txt \

> The IMA measurement list may contain records for other PCR 10.  The
> output may contain other PCRs.  Using "PCRAgg.*10:" is safer.  
> Probably need to use "grep -m 1 -E" as well.
+1 good point.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
