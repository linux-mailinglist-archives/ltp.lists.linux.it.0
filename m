Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FADB49AEE9
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jan 2022 10:08:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E12D13C9289
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jan 2022 10:08:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 661C63C5924
 for <ltp@lists.linux.it>; Tue, 25 Jan 2022 10:08:13 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E1FD61000A3C
 for <ltp@lists.linux.it>; Tue, 25 Jan 2022 10:08:12 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9AACA2113B;
 Tue, 25 Jan 2022 09:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643101691;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vv/G1Hjb+CUN5qvFcCTdgBzaiwu/sjviGxDPqN0dI0M=;
 b=ADUnP2C4w/69Lh5wuTzGVWaLFiNnvbrROATcCzSCqUp3xdESU3qQidwcT9d84wK9aXunO+
 0txfhSWFYGtArfNLj3SpjF7FKoB19BMR5ASfHpoezH7l1x4U7OGLS4s3jHo0voM3P+Yc2Q
 nlmuEtUZWdnTXKeAXuyEq3vGSx2cymw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643101691;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vv/G1Hjb+CUN5qvFcCTdgBzaiwu/sjviGxDPqN0dI0M=;
 b=+yDR4aicUDrlslI+FH67pHpbTp4+hlrTPrRAiqM5G1wV64lF2ELCRhxBBh3X6ugqaVtJtm
 thEdoHiLbDbFkNCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 53D9013DA0;
 Tue, 25 Jan 2022 09:08:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id E0Q3Evu972FaPgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 25 Jan 2022 09:08:11 +0000
Date: Tue, 25 Jan 2022 10:08:09 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <Ye+9+fpr31Bube0R@pevik>
References: <20220124220334.154003-1-petr.vorel@gmail.com>
 <29051e9c-f4c2-9840-7f84-8c9f49efba93@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29051e9c-f4c2-9840-7f84-8c9f49efba93@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] tst_net.sh: Fix for disabled IPv6
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey, all,

...
> > @@ -971,8 +1003,16 @@ IPV6_RHOST="${IPV6_RHOST:-fd00:1:1:1::1/64}"
> >  if [ -z "$_tst_net_parse_variables" ]; then
> >  	eval $(tst_net_ip_prefix $IPV4_LHOST || echo "exit $?")
> >  	eval $(tst_net_ip_prefix -r $IPV4_RHOST || echo "exit $?")
> > -	eval $(tst_net_ip_prefix $IPV6_LHOST || echo "exit $?")
> > -	eval $(tst_net_ip_prefix -r $IPV6_RHOST || echo "exit $?")
> > +
> > +	tst_net_detect_ipv6 && TST_NET_LHOST_IPV6=1
> > +	tst_net_detect_ipv6 rhost && TST_NET_RHOST_IPV6=1
> > +
> > +	if [ "$TST_NET_LHOST_IPV6" = 1 ]; then
> > +		eval $(tst_net_ip_prefix $IPV6_LHOST || echo "exit $?")
> > +	fi
> > +	if [ "$TST_NET_RHOST_IPV6" = 1 ]; then
> > +		eval $(tst_net_ip_prefix -r $IPV6_RHOST || echo "exit $?")
> > +	fi

> Do we really need to keep around and check two variables? If at least
> one machine doesn't have IPv6, it's not longer necessary to setup the
> other.

OK, just one variable is enough, e.g. TST_NET_REQUIRE_IPV6.

@all: But netns_helper.sh, which does not use tst_net.sh also requires IPv6
(and there are probably more), thus how about adding flag TST_REQUIRE_IPV6
into tst_test.sh (would help also for documentation - docparse).
And tst_net.sh would just on check also IPv6 on rhost.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
