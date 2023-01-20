Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 332AF675440
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Jan 2023 13:14:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57F113CBD23
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Jan 2023 13:14:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A44CA3CB43E
 for <ltp@lists.linux.it>; Fri, 20 Jan 2023 13:14:47 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 019DB1A011DE
 for <ltp@lists.linux.it>; Fri, 20 Jan 2023 13:14:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BE75C5F952
 for <ltp@lists.linux.it>; Fri, 20 Jan 2023 12:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1674216885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nrenMhyzrEA7hb8FuhaCQhtwai7/0P70McHZzdcRIYU=;
 b=ICLgzjFze52odXqdaGJ/r8O1gagKzNJGfCvtZBxmI3CxPWatTzR5giZV25O8og/TC6cuw6
 JqYucY017Hxp7xxzpvmxFJ8lI/ZHd2c076bH4Df3Vg7MYQlEiLXfEpuUjbizYMB/LMLNtJ
 13kjxkt0R++N9sAwTqMnsPHS6516JgE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1674216885;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nrenMhyzrEA7hb8FuhaCQhtwai7/0P70McHZzdcRIYU=;
 b=IWA179LrgSD/k81q8b6nHWimM8Ume6KqtmtwRZqQwK8VjuYZG+0gJvSZXzJH5caG+qAJTX
 88rtBDnSPkBOsGCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC8081390C
 for <ltp@lists.linux.it>; Fri, 20 Jan 2023 12:14:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4ZBqKLWFymMsEgAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 20 Jan 2023 12:14:45 +0000
Date: Fri, 20 Jan 2023 13:16:20 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Message-ID: <Y8qGFOF2M+VuTpmD@yuki>
References: <Y8VRpdW7LUh4uFm9@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y8VRpdW7LUh4uFm9@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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

Hi!
I did my share of pre-release testing and apart from the statvfs01 I've
send a patch for there rest of results looks green.

I also did test the runltp-ng and we fixed a few bugs there in order to
have a flawless experince since it will be introduced in the LTP
tarball. It would be great if anyone else would do so as well.

And given that the mailing list is mostly silent I suppose, unless
anybody objects, that we can freeze the git now and declare the next
week as pre-release testing week. With that we would be aiming for the
release either at Friday 27.01. or at Monday or Tuesday 29-30.01.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
