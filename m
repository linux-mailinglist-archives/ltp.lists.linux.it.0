Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC343A96C1
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 12:01:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D8CD3C4CB8
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 12:01:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 622993C2174
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 12:01:54 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DFDA5600C4D
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 12:01:53 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4C4C91FD2F;
 Wed, 16 Jun 2021 10:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623837713;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=osDLGsHqVCgtNnSwN+2+IiCcfsb5TacypU2vEu4qARk=;
 b=OYNaYOnKwjjtKEZ4jNIk8uy0x/4G+x6otLVhJsjnHWtrHumsZvy1eE5rkoEEXKHp4MRqaY
 HnWPcEPtesPPThXASRze/S2jAj0ebAAb7FjUqj85j0a2xJ7v6RzHrdpqktJjM1EVSfd7BF
 IaX8BZsDJWXVENP1B09ytFMJ8ByfGaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623837713;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=osDLGsHqVCgtNnSwN+2+IiCcfsb5TacypU2vEu4qARk=;
 b=4aR1Vim81sGltCr5duqTafifQLbwqH223QbM7baxf7UXtxP6xcy6YXbDw3+AXvBGgK+1iG
 SKNlmI17XmTzp1Aw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id ACD2C118DD;
 Wed, 16 Jun 2021 10:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623837713;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=osDLGsHqVCgtNnSwN+2+IiCcfsb5TacypU2vEu4qARk=;
 b=OYNaYOnKwjjtKEZ4jNIk8uy0x/4G+x6otLVhJsjnHWtrHumsZvy1eE5rkoEEXKHp4MRqaY
 HnWPcEPtesPPThXASRze/S2jAj0ebAAb7FjUqj85j0a2xJ7v6RzHrdpqktJjM1EVSfd7BF
 IaX8BZsDJWXVENP1B09ytFMJ8ByfGaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623837713;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=osDLGsHqVCgtNnSwN+2+IiCcfsb5TacypU2vEu4qARk=;
 b=4aR1Vim81sGltCr5duqTafifQLbwqH223QbM7baxf7UXtxP6xcy6YXbDw3+AXvBGgK+1iG
 SKNlmI17XmTzp1Aw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id eAf0JxDMyWBEPwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 16 Jun 2021 10:01:52 +0000
Date: Wed, 16 Jun 2021 12:01:50 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YMnMDulm9C+SDdXa@pevik>
References: <20210615163307.10755-1-pvorel@suse.cz>
 <20210615163307.10755-4-pvorel@suse.cz>
 <CAEemH2eLDk8rb3wUMCjz6Txo333f4Mae1AWZy0Rt6mTYuvYf6w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2eLDk8rb3wUMCjz6Txo333f4Mae1AWZy0Rt6mTYuvYf6w@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 3/3] doc: Update LTPROOT and PATH environment
 variables
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> > -$ LTPROOT=/opt/ltp PATH="$PATH:$LTPROOT/testcases/bin" testcases/bin/wc01.sh
> > +$ LTPROOT=/opt/ltp testcases/bin/wc01.sh

> I'm wondering does this really work? or, did I miss something?
Oops, I'm sorry to send broken patchset, this is obviously wrong.
We have to keep path set when calling script directly, because tst_test.sh would
be missing.

when in LPTROOT directory:
LTPROOT=/opt/ltp testcases/bin/wc01.sh
testcases/bin/wc01.sh: line 13: .: tst_test.sh: file not found

But we don't want to set path in each script nor load library as
. testcases/bin/tst_test.sh

Thus I guess setting PATH in LTP API doesn't make much sense if it works only
when using LTP runner (runltp{,-ng}, which BTW set path as well.
=> closing this.

> Experiment in my kvm guest (with apply your patches):

> # LTPROOT=/root/ltp-install wc01.sh
> bash: wc01.sh: command not found...
I would not expect this to be running, for this you obviously need to have set
PATH correctly.

> # LTPROOT=/root/ltp-install testcases/bin/wc01.sh
> -bash: testcases/bin/wc01.sh: No such file or directory
Nor this one.

Kind regards,
Petr

> # LTPROOT=/root/ltp-install PATH="$PATH:$LTPROOT/testcases/bin" wc01.sh
> wc01 1 TINFO: timeout per run is 0h 5m 0s
> wc01 1 TPASS: wc passed with -c option.
> wc01 2 TPASS: wc passed with --bytes option.
> wc01 3 TPASS: wc passed with -l option.
> wc01 4 TPASS: wc passed with --lines option.
> wc01 5 TPASS: wc passed with -L option.
> wc01 6 TPASS: wc passed with --max-line-length option.
> wc01 7 TPASS: wc passed with -w option.
> wc01 8 TPASS: wc passed with --words option.
> wc01 9 TPASS: wc passed with -m option.
> wc01 10 TPASS: wc passed with --chars option.
> wc01 11 TPASS: wc passed with --help option.
> wc01 12 TPASS: wc passed with --version option.

> Summary:
> passed   12
> failed   0
> broken   0
> skipped  0
> warnings 0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
