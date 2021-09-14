Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 143DC40ADBE
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 14:32:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 992B33C89FA
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 14:32:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 770B63C1DB4
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 14:32:25 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A66D2200FE4
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 14:32:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F1056220CC;
 Tue, 14 Sep 2021 12:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631622743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iZWPEKo6cPFdVOobMPXvGdoz8TsI3v2wZVH0dMhPiGM=;
 b=kvnkmBlp74ukkT0DrByPcVzHwt1u83sEjNOpUCGn3czulbkY6RFpK9CkSIgyt5zy8FDRdm
 qcH7iTTm27cez6TPxQ95DNm7b5Ta380Fl9OSWxwxN0l4dBArQGVGGBEKEjD/yhTdv3zLc+
 IW1Wr8h8L9kHjK89mZmpSQEwp7Bwetg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631622743;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iZWPEKo6cPFdVOobMPXvGdoz8TsI3v2wZVH0dMhPiGM=;
 b=cqa+lasYdZkX/YA2m1KXyRwh79lamUmnsnqAdz1ZoNQTHgu80wGB7pl/9NE9saTYmzAJUM
 kKI43k+ZHPv6z+Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DBC9513342;
 Tue, 14 Sep 2021 12:32:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Y0mfNVeWQGE0LgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 14 Sep 2021 12:32:23 +0000
Date: Tue, 14 Sep 2021 14:32:45 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YUCWbfn/cm2Cr2U5@yuki>
References: <a47ecbd7-ba4a-ff2c-ead9-e731040cb845@jv-coder.de>
 <20210914083444.23848-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914083444.23848-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] memcg_subgroup_charge: Remove limiting of parent
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> It is not important how much memory is assigned to the parent
> group. The stated purpose of the test is to check no memory is
> assigned to the child group.
> 
> Also add the usage stats for the memcg_process because it appears
> the test will fail because the starting memory counter already
> includes some buffer/cache on linux-next. I'm not sure this
> is exactly what happens, but displaying the stats might help.

Uff just found that there is a similar patch from Joerg as well:

http://patchwork.ozlabs.org/project/ltp/patch/20191106061808.67330-1-lkml@jv-coder.de/

Either way we should merge one of them to get this finally fixed.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
