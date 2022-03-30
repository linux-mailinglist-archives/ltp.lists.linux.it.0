Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8155A4EBD95
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Mar 2022 11:23:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 510343C9DDE
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Mar 2022 11:23:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AACE53C089F
 for <ltp@lists.linux.it>; Wed, 30 Mar 2022 11:23:22 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5C5C760004A
 for <ltp@lists.linux.it>; Wed, 30 Mar 2022 11:23:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6D902210FC;
 Wed, 30 Mar 2022 09:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1648632201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DSt8H6/L9YDBYRRf79rnBIwrHb5vtExVMBr/ie1GD2c=;
 b=H9LZCslol3HCfysDz8ifVCMAGxZICRK+gWJpKe5qdbUJTFeJqlyZ/AlvzP3DlJRGU3ITw/
 fvXTHdeY+CltKgxPfmbRR+dz1cnOSzMdMLgGHUL5aIgPfHtbZTbToLEIMvNhRzkoZVRzWx
 uhGpoeWikKQh1UFHY/FLUC/6sv9lCMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1648632201;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DSt8H6/L9YDBYRRf79rnBIwrHb5vtExVMBr/ie1GD2c=;
 b=FNe77GoH9nHHr8Mf1YmM7Kma5t682b2tyX/tVZG3HiCZx3ZyHTBPuyK7padUrrCa90wFgk
 DbY8EEda5gFcFBAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5986113A60;
 Wed, 30 Mar 2022 09:23:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id e84IFYkhRGIFWgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 30 Mar 2022 09:23:21 +0000
Date: Wed, 30 Mar 2022 11:25:41 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YkQiFRTwAyTsSHC0@yuki>
References: <20220328123114.31881-1-andrea.cervesato@suse.de>
 <YkHNxNcEy/xHv5wz@yuki> <YkMt7jRjMwdoIduD@gacrux.arch.suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YkMt7jRjMwdoIduD@gacrux.arch.suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Fix wqueue09 according with 5.17 kernel updates
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
> FYI while test works on small -i, it blocks on higher:
> 
> ./wqueue09 -i1000
> ...
> common.h:153: TINFO: NOTIFY[000]: ty=000000 sy=01 i=00000008
> wqueue09.c:48: TPASS: Meta loss notification received
> common.h:134: TINFO: Reading watch queue events
> common.h:153: TINFO: NOTIFY[000]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[010]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[020]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[030]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[040]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[050]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[060]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[070]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[080]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[090]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[0a0]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[0b0]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[0c0]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[0d0]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[0e0]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[0f0]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[100]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[110]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[120]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[130]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[140]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[150]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[160]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[170]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[180]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[190]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[1a0]: ty=000001 sy=01 i=00000110
> common.h:134: TINFO: Reading watch queue events
> common.h:153: TINFO: NOTIFY[000]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[010]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[020]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[030]: ty=000001 sy=01 i=00000110
> common.h:153: TINFO: NOTIFY[040]: ty=000001 sy=01 i=00000110
> common.h:134: TINFO: Reading watch queue events
> common.h:153: TINFO: NOTIFY[000]: ty=000000 sy=01 i=00000008
> wqueue09.c:48: TPASS: Meta loss notification received
> common.h:134: TINFO: Reading watch queue events
> => timeouts
> 
> I tested this on ppc64le with 65k page size on 5.17.0-rc5-150400.9-default
> But it's not page size specific, as it fails also on x86_64 with the default 4k
> page size.

That would mean that the keyctl() operations did fail, I guess that we
should check the results of these calls.

> And *without* this patch it's also broken with higher -i (tested on both x86_64
> with the default 4k page size and ppc64le with 65k):
> 
> ./wqueue09 -i1000
> wqueue09.c:48: TPASS: Meta loss notification received
> common.h:134: TINFO: Reading watch queue events
> common.h:152: TINFO: NOTIFY[000]: ty=000001 sy=01 i=00000110
> common.h:134: TINFO: Reading watch queue events
> common.h:152: TINFO: NOTIFY[000]: ty=000000 sy=01 i=00000008
> wqueue09.c:48: TPASS: Meta loss notification received
> common.h:86: TBROK: add_key error: EDQUOT

This may be solveable by moving the add_key() call to the test setup.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
