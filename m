Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C29543B51B
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Oct 2021 17:07:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 85B803C68B3
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Oct 2021 17:07:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C93CB3C6634
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 17:07:11 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3C6BE1400202
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 17:07:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 72A0C2195A;
 Tue, 26 Oct 2021 15:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635260830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JrlsUx3U/Oem/dPA8Ye2bG9x9r5BhvXcfflCR0lY1DE=;
 b=VAVy+ebpodNqShWOhC4BF8vcjH0Fz2Ag196yAXeNZNdj19ahG4N3zpGC69Sa2cZ05lNWiE
 oDDAqK37eo8ewQQd1HWukpV0ZAKNaMU8pZlMp/mLsj1gBb0flY0GiewYWe/4zKR8XX72Et
 jL/cWU8hLjf9tMfOD9rYDbn4eGw9jwU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635260830;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JrlsUx3U/Oem/dPA8Ye2bG9x9r5BhvXcfflCR0lY1DE=;
 b=B97vhuHmUvYYt9o6Kc/iXkeyRUjRITPSyT6ze/jDoeKN3dvLP8hR9By9DQ0GYkkyUSWGmy
 3CXF8Vr/yKQIAEBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5E29413FA7;
 Tue, 26 Oct 2021 15:07:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iAHDFZ4ZeGGdKQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 26 Oct 2021 15:07:10 +0000
Date: Tue, 26 Oct 2021 17:08:00 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <YXgZ0CK737PXTv5Y@yuki>
References: <04692b4000ee415add41128173e395f830ea3e56.1635168255.git.jstancek@redhat.com>
 <b987a73550937e5d5652e4a86e591d72334d8fda.1635244875.git.jstancek@redhat.com>
 <YXfeAnRORHareVtn@yuki>
 <CAASaF6wZEaQjUy8RU9TCp6GpWKN6FkQSWtOb2iLDNY_1KCmE8g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAASaF6wZEaQjUy8RU9TCp6GpWKN6FkQSWtOb2iLDNY_1KCmE8g@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] finit_module02: fix exp. errno for O_WRONLY
 testcase
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Also I'm starting to wonder if the errno from dir_setup() should be
> > fixed in the kernel as well. I guess that EISDIR sounds much better
> > error than EINVAL.
> 
> It does.

Will you send a kernel patch or should I do it?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
