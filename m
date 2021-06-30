Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC1F3B814B
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 13:29:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E2E643C6CEC
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 13:29:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E858C3C0234
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 13:29:48 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B87D86012CB
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 13:29:47 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 194891FE76;
 Wed, 30 Jun 2021 11:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625052587;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xPlVznWY17sCdzDew0ArEqg6XigOQOCtFmbDtY+DTDg=;
 b=ahMFe4kxqAr6ueSduanu8ivNo0m8vDKaSEkb4pG/Qi/05WQRTOrGkzh1J40pYoAJ3KBikV
 M5JYxKcMeW0svIA/2h2D7Veog/xZ+B8jDsWLdxSJDpkdqWV9IphicqsKgIpyp5JJEPF1Oh
 R9PvwOBQhAK+NvxsEWVRcSz7joKLYXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625052587;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xPlVznWY17sCdzDew0ArEqg6XigOQOCtFmbDtY+DTDg=;
 b=ISanfFyNsTDcmf/hJGeEewWmmA9CgWCXw2JvPbz70fjhijtToL0lFRU1PwRQLCUjZpzy/+
 +yWiGRLd8SPAPQBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id BC248118DD;
 Wed, 30 Jun 2021 11:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625052587;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xPlVznWY17sCdzDew0ArEqg6XigOQOCtFmbDtY+DTDg=;
 b=ahMFe4kxqAr6ueSduanu8ivNo0m8vDKaSEkb4pG/Qi/05WQRTOrGkzh1J40pYoAJ3KBikV
 M5JYxKcMeW0svIA/2h2D7Veog/xZ+B8jDsWLdxSJDpkdqWV9IphicqsKgIpyp5JJEPF1Oh
 R9PvwOBQhAK+NvxsEWVRcSz7joKLYXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625052587;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xPlVznWY17sCdzDew0ArEqg6XigOQOCtFmbDtY+DTDg=;
 b=ISanfFyNsTDcmf/hJGeEewWmmA9CgWCXw2JvPbz70fjhijtToL0lFRU1PwRQLCUjZpzy/+
 +yWiGRLd8SPAPQBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ImMGLKpV3GD+LgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 30 Jun 2021 11:29:46 +0000
Date: Wed, 30 Jun 2021 13:29:45 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Josef Bacik <josef@toxicpanda.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Qu Wenruo <wqu@suse.com>, Chris Mason <clm@fb.com>,
 "kernel-team@lists.ubuntu.com" <kernel-team@lists.ubuntu.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>,
 David Sterba <dsterba@suse.com>, Filipe Manana <fdmanana@suse.com>,
 linux-btrfs@vger.kernel.org
Message-ID: <YNxVqca+WeQcBmzA@pevik>
References: <a3b42abc-6996-ab06-ea9f-238e7c6f08d7@canonical.com>
 <e4c71c01-ed70-10a6-be4d-11966d1fcb75@toxicpanda.com>
 <b5c6779b-f11d-661e-18c5-569a07f6fd8e@canonical.com>
 <YNxTr43lvviG0GOn@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNxTr43lvviG0GOn@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [BUG] btrfs potential failure on 32 core LTP test
 (fallocate05)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

...
> > >> Reproduction steps:
> > >> git clone https://github.com/linux-test-project/ltp.git
> > >> cd ltp
> > >> ./build.sh && make install -j8
> > >> cd ../ltp-install
> > >> sudo ./runltp -f syscalls -s fallocate05

NOTE: you can also be a bit faster if you test just single test, see
https://github.com/linux-test-project/ltp#shortcut-to-running-a-single-test
(not compiling and installing whole LTP)

$ cd testcases/kernel/syscalls/fallocate/
$ make -j`nproc`
$ sudo ./fallocate05

> > > This thing keeps trying to test ext2, how do I make it only test btrfs?  Thanks,

> > It tests all available file systems, just wait till it gets to btrfs. I
> > don't know how to limit it only to one file system.
> In the future we can add environment variable to specify the only fs to be
> tested. There is LTP_DEV_FS_TYPE, but that does not work when .all_filesystems
> flag is enabled. Thus just patch the file:

NOTE: It detect kernel filesystem support and presence of mkfs.xxx.
Thus other way to limit filesystem is to rename mkfs.xxx of other filesystems
(in case you test LTP from package and don't want / cannot compile and can
modify root filesystem).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
