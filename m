Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F44E1C94
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 15:28:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 971443C1CB7
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 15:28:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 535AF3C185E
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 15:28:37 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 83B76200DF0
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 15:28:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571837314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tJCapT3NkBuxidZaW8ShUvqBQiLVtRdo9DUWoJ842Vs=;
 b=DANNYE/JL3ZGGnbxa12csvDxQ5vIbZID8FgoeDa/4JTpfMi4X3OnywCQLN0WP2BSiDyO15
 TgbRxnfbm8cRVWyaRdpVPgT5/TyPz2hb5p3sHRE2cUm3o3R6wfGquVoFf1IYatNlYrpXxr
 exP3M/JmoknL558WjFv35FdWbCr7fOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212--_KN3NzhP5Cp91cHRBm7pA-1; Wed, 23 Oct 2019 09:28:27 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C64DA476;
 Wed, 23 Oct 2019 13:28:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB7ED10027A8;
 Wed, 23 Oct 2019 13:28:26 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id B1E783FB40;
 Wed, 23 Oct 2019 13:28:26 +0000 (UTC)
Date: Wed, 23 Oct 2019 09:28:26 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <463301336.8732968.1571837306503.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191023121901.GA25868@dell5510>
References: <c8843f2f4a325e820d030d9c7c36d7624f1baa82.1571393044.git.jstancek@redhat.com>
 <20191023121901.GA25868@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.22]
Thread-Topic: lsmod01.sh: retry test couple times to lower false positives
Thread-Index: hYwKkp0oGaDjXKykEQzC3YrvWhQmFg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: -_KN3NzhP5Cp91cHRBm7pA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lsmod01.sh: retry test couple times to lower
 false positives
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> 
> > -	tst_res TPASS "'lsmod' passed."
> > +lsmod_test()
> > +{
> > +	for i in $(seq 1 5); do
> > +		if lsmod_matches_proc_modules; then
> > +			tst_res TPASS "'lsmod' passed."
> > +			return
> > +		fi
> > +		tst_res TINFO "Trying again"
> > +		sleep 1
> > +	done
> This is similar pattern to TST_RETRY_FUNC()/TST_RETRY_FN_EXP_BACKOFF()
> (for both shell and C). I wonder if we also have use for TPASS/TFAIL
> instead of just TBROK and specifying number of tries instead of time to be
> setup.

I think TFAIL fits more here, it's outcome of what we are testing.
TBROK in my mind is failure unrelated to subject of test.

But functionally TST_RETRY_FUNC should work too. 

> C and shell usage is a bit different, so maybe
> TST_RETRY_FUNC()/TST_RETRY_FN_EXP_BACKOFF() doesn't make much sense for shell

I see it used in mkswap01.sh and numa01.sh.

I wonder if we need to TBROK in TST_RETRY_FUNC(). We could just return
what the FUNC returns and let the test decide.
TST_RETRY_FUNC_BRK() could be a wrapper that TBROKs on timeout.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
