Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B77E1408C39
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 15:15:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 33DD03C92A1
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 15:15:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B93033C1DAB
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 15:14:59 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0745C200BD4
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 15:14:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 26A4121F01;
 Mon, 13 Sep 2021 13:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631538898;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z0MPEFhIRbjJf1xEpQntNbo4VIhoZYXtKYQUpjGe5jQ=;
 b=af0/jFQJMFoS+nfO1Aq8/RTeGLU/Aujwva9I2NtdDxlCJwZjiQvetHC8zBiOza268WsPHg
 R5FPA+oK/R2cBcc4NIXxPgjfMueC7dkqYp7xdVE49RNin8vUPgNp5r/yjd48vh8/c4/To7
 ldZEu7nrRlkYv465LdlSOEKsATLY9pM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631538898;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z0MPEFhIRbjJf1xEpQntNbo4VIhoZYXtKYQUpjGe5jQ=;
 b=XHEmCBpb1JlBhjTeQNvR+3BwaJLY3vccUmROXYc9NckYkc2Yf+3iAsckx5VfVl7aPSqFMS
 z1n3qeD3IqIKLMDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D2AED13F12;
 Mon, 13 Sep 2021 13:14:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XNmHMNFOP2HmOQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 13 Sep 2021 13:14:57 +0000
Date: Mon, 13 Sep 2021 15:14:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YT9OziyltlUo+Vnb@pevik>
References: <CA+G9fYtJYK4C4q7v2VBgyHe1EdOeZ=auEytoKJr0gYThj8gS5w@mail.gmail.com>
 <cab131c0-877e-4781-6d0e-07a6e528b329@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cab131c0-877e-4781-6d0e-07a6e528b329@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] LTP: smoketest: route4-change-dst fails intermittently
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On 03.09.2021 09:33, Naresh Kamboju wrote:
> > LTP smoketest  "route4-change-dst" fails intermittently on various
> > devices and qemu.
> > We do not want any intermittent failures on LTP smoketest.
> > Shall i send a patch to delete this test case from runtest/smoketest ?


> route4-change-dst is a stress test, perhaps replacing it with more
> simple like ping01.sh or ping02.sh that still triggers LTP/tst_net
> library check?
I overlooked your suggestion. OK, I'll merge replacing route4-change-dst with
ping02.sh -6.

> BTW, such tests may overlap with existed network setup on a test
> machine, by default they are using 10.0.0.0/24. Changing defaults
> is done via IPV4_LHOST and IPV4_RHOST environment variables.
I wonder if using IPV4_NET16_UNUSED and IPV6_NET32_UNUSED would help. Unless we
create a detection of whether they're actually unused (not sure even how to
implement nmap like search which would be fast enough) there still can be a
collision. But at least the addresses ranges in *UNUSED are less common.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
