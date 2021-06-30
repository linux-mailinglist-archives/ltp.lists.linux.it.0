Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 512583B8046
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 11:46:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 097903C6C51
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 11:46:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1464C3C180B
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 11:46:30 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4E3A5601258
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 11:46:30 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A625721C1C;
 Wed, 30 Jun 2021 09:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625046389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8LCmDYddu7MNCTy/CNqE4+hHl21nyRyT89Ccfom9uZk=;
 b=sWozjNCGcu7Iv+au5kpSNgH0tS3udJUiFRJqI8F5BGpVa1pLjKBmjHQNaIRJZLHFDXxIJp
 KV1/Pqd4rw4PwuozXZvGP8yGouQoSQZv+aGx0XKOitYvN2ERj/LuXKrmSQcVT1rYS8OoAD
 TIPL7Nke5yn3eT8Xwwf3u/i7rDICDHc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625046389;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8LCmDYddu7MNCTy/CNqE4+hHl21nyRyT89Ccfom9uZk=;
 b=gH+/VclWCYemLft6C75dJLoPTmH6XXsBbbP7Z6fGQFmsRLv9xY7OWhDaK/WBYHPEOtZjvF
 5OyeF4818pZ/ZuCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 827FD11906;
 Wed, 30 Jun 2021 09:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625046389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8LCmDYddu7MNCTy/CNqE4+hHl21nyRyT89Ccfom9uZk=;
 b=sWozjNCGcu7Iv+au5kpSNgH0tS3udJUiFRJqI8F5BGpVa1pLjKBmjHQNaIRJZLHFDXxIJp
 KV1/Pqd4rw4PwuozXZvGP8yGouQoSQZv+aGx0XKOitYvN2ERj/LuXKrmSQcVT1rYS8OoAD
 TIPL7Nke5yn3eT8Xwwf3u/i7rDICDHc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625046389;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8LCmDYddu7MNCTy/CNqE4+hHl21nyRyT89Ccfom9uZk=;
 b=gH+/VclWCYemLft6C75dJLoPTmH6XXsBbbP7Z6fGQFmsRLv9xY7OWhDaK/WBYHPEOtZjvF
 5OyeF4818pZ/ZuCA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id /qYLH3U93GBzbwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 30 Jun 2021 09:46:29 +0000
Date: Wed, 30 Jun 2021 11:20:56 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YNw3ePbVhio3s9JX@yuki>
References: <CAEemH2da0dOeKpnZZ6+A696gFL+nDAiP7UL9tqm68JH8KO-Qkw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2da0dOeKpnZZ6+A696gFL+nDAiP7UL9tqm68JH8KO-Qkw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Limit the tmpfs size on mounting
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
> LTP mount and make use of the whole tmpfs of the test system,
> generally, it's fine. But if a test (e.g fallocate06) try to fill full in
> the
> filesystem, it takes too long to complete testing on a large memory
> system.
> 
> I'm thinking whether we should limit the mount tmpfs size for the
> LTP test, maybe only give 512MB?  but the tricky part for me is to
> add options like "-o size=512M" to prepare_device(), or do some
> additional work for tmpfs mounting.
> 
> and any else way can speed up is also welcome. I'd like to hear
> more advice. Thanks!

I guess that appending '-o size ...' to the mount flags in prepare_device()
is reasonable, but instead of hardcoing the value we should do the same
as we do with the loop devices and the size should be
MAX(tst_test->dev_min_size, DEV_SIZE_MB).

For tmpfs we will do something as:

	...
	const char *mnt_data = tst_test->mnt_data;

	if (!strcmp(dev.fs_type, "tmpfs")) {
		unsigned int dev_size = MAX(tst_test->dev_min_size, DEV_SIZE_MB);

		if (tst_test->mnt_data) {
			snprintf(buf, sizeof(buf), "%s,-o size %uMB",
				 tst_test->mnt_data, dev_size);
		} else {
			snprintf(buf, sizeof(buf), "-o size=%uMB", dev_size);
		}

		tst_res(TINFO, "Limiting tmpfs size to %uMB", dev_size);

		mnt_data = buf;
	}

> # df -Th | grep tmpfs
> Filesystem                             Type      Size  Used Avail Use%
> Mounted on
> devtmpfs                               devtmpfs  126G     0  126G   0% /dev
> tmpfs                                  tmpfs     126G  4.0K  126G   1%
> /dev/shm
> tmpfs                                  tmpfs     126G   18M  126G   1% /run
> tmpfs                                  tmpfs     126G     0  126G   0%
> /sys/fs/cgroup
> /dev/loop0                             tmpfs     126G   23G  104G  18%

Also it looks like should pass something as "ltp-tmpfs" instead of the
"/dev/loopX" string in a case of "tmpfs" filesystem in order not to
confuse people...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
