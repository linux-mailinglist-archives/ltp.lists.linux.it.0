Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3A779E677
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Sep 2023 13:18:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C2B0E3CB33E
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Sep 2023 13:18:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4443E3CB2A5
 for <ltp@lists.linux.it>; Wed, 13 Sep 2023 13:18:01 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2B5B61A027B7
 for <ltp@lists.linux.it>; Wed, 13 Sep 2023 13:18:00 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D65BB1F390;
 Wed, 13 Sep 2023 11:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1694603879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0b9huC2usDgwHg6Ke6FLp1rJ2PqS+XmQkLZdYMPDmyY=;
 b=T7yKg9E8Y3OJ3sySOSxpSovN01+l4vNTrKl/8kF980/2XBPQjyQPXx+TlHrYgMKbfoLjv2
 9/evgnRoCQvX3qhQRu2YInp9I1PsXcAD13PF3gJy3FFCPumDo+3JY5h0OH+wtiCRApyIfo
 YX+HbApFP3eJZ3zXXT+07HrK4f6cJX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1694603879;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0b9huC2usDgwHg6Ke6FLp1rJ2PqS+XmQkLZdYMPDmyY=;
 b=eHoJ5EpphRx6/XiILYOnyGJfjeimYKZs2VwKIPFFClDU/aX1CtUqYhDP//XH/g+PRZbWMf
 hso4+O38ZHqRdYAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C293013582;
 Wed, 13 Sep 2023 11:17:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dHWvLmeaAWU0fwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 13 Sep 2023 11:17:59 +0000
Date: Wed, 13 Sep 2023 13:18:46 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <ZQGalg29A63v7Hnz@yuki>
References: <ZQF5J0UJ25_QLwcQ@yuki>
 <a483870d-f54e-4fb3-8427-003c369a96c1@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a483870d-f54e-4fb3-8427-003c369a96c1@suse.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] LTP Release preparations
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

Hi!
> > As usuall we are supposed the release LTP at the end of the month. In
> > order to get at least two weeks of pre-release testing I would like to
> > freeze the git starting next week. I will try to review and merge as
> > much as possible till the end of this week. If there is anything that
> > you think should go into the release let me know so that I can have a
> > look.
> >
> It would be nice to push mqns_03/mqns_04 since they have been already 
> reviewed by Petr Vorel.
> In this way we can finally remove libclone library from LTP containers 
> testing suite.

The v8 has been set to 'changes requested' in patchwork, hence it got
lost from from my radar, I will have a look.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
