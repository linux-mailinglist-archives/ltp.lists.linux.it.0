Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FE37AADC4
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Sep 2023 11:23:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C26443CBDFC
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Sep 2023 11:23:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E9AFE3C99DB
 for <ltp@lists.linux.it>; Fri, 22 Sep 2023 11:23:49 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 214BE1A0021F
 for <ltp@lists.linux.it>; Fri, 22 Sep 2023 11:23:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F16301F45A
 for <ltp@lists.linux.it>; Fri, 22 Sep 2023 09:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695374627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLQVSStw4SNyjEX4WYdCoULMfTOOHR9bpphUXmLVX4k=;
 b=u5CRxdbOX1zPemRRML1Nsc02xpvTEU7wFzr4IiXHxQCelzXsS5nnqavH7qrbXGwpBWPC1D
 zoraciirQkqhKuGOTEW/ow5Mk3tpgnZt4Y20J/t7Z35yY3wUdZtDmhDVS27tKv+S20EGZn
 Ydyfd3oVXM2pV+FhdkX/r083NIVGy8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695374627;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLQVSStw4SNyjEX4WYdCoULMfTOOHR9bpphUXmLVX4k=;
 b=io8qq/FFfCiFZzre7uVi149jna7NJFzBUH10AJrZ5/mDXvTu7L6amgde5QU4NhkC8jIYPa
 ZgiTmveQjS+ObSAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E3E7813478
 for <ltp@lists.linux.it>; Fri, 22 Sep 2023 09:23:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id l1qPNiNdDWUQWgAAMHmgww
 (envelope-from <mkittler@suse.de>)
 for <ltp@lists.linux.it>; Fri, 22 Sep 2023 09:23:47 +0000
From: Marius Kittler <mkittler@suse.de>
To: ltp@lists.linux.it
Date: Fri, 22 Sep 2023 11:23:47 +0200
Message-ID: <5973304.lOV4Wx5bFT@linux-9lzf>
In-Reply-To: <ZQzZIBNGHkj9/4n0@wegao>
References: <20230921090658.11224-1-mkittler@suse.de> <ZQzZIBNGHkj9/4n0@wegao>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Port getxattr03.c to new test API
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Am Freitag, 22. September 2023, 02:00:32 CEST schrieb Wei Gao:
> > #ifdef HAVE_SYS_XATTR_H
> 
> Normally i saw this kind of ifdef in include/lapi/xattr.h
> I suppose we need create include/lapi/xattr.h?

No, we don't need that header here. This macro is actually defined in `config.h` 
which also makes sense as it is generated at configuration time. Note that also 
all builds (including musl) are passing with this change, see
https://github.com/Martchus/ltp/actions/runs/6259530698.




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
