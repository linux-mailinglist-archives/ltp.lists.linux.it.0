Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BB974151
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 00:17:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A8E43C1CFC
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 00:17:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 781BD3C14BC
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 00:17:48 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BD027200C13
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 00:17:47 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id n9so15673614pgc.1
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 15:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HTNb3qQ9guy8DvE8F62NBS689nVWePvWU3zNIZoLZPE=;
 b=tkcOmR6PLyUxupF4pFDV9DipC8bFVbr7EeuyLC49voUO9azkWW4aW+LS0wAdnq9JNX
 Jk5nJNQdQoDbFPBJJoSFtMN77FNjUgMS6U4jI7Wfymthwts/VkvuTNbufkeeUK7Eq0fW
 Yqcrt7ht9vd+3NLq9TPzKPsaBehLhPCw3bN/u+2iuNXiH7f2bHHU20a6hu0sH8bjdwP4
 1sEwXmSp+HLZrLg4c/mpshgqEYkTwVdpJmprMTq00qvks1L1/T+TiZtGJ5B99RNn1neJ
 V0H1qA5c5AZjFjPGGhGx5z5ihIRjaSePD6wWr6LSdLLXj2CcORPWdgMd6QsHiTmVBQW+
 Ba0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HTNb3qQ9guy8DvE8F62NBS689nVWePvWU3zNIZoLZPE=;
 b=N/9okrTwRX04argPA2EGScnci1XvcAvsgH0LpUYQ5DBvDIIUJnX98C9BDmCja4Nz5U
 PooO33yM9dX8tQJ0eHjWlWn4FSiZ6KhjwyFS6B/Ldi1fX4cyS3/YTHXj7CiCcMqzoxcx
 VYfhPX/kyqXycs+uSZcdaBialK4ugdy9tw8127EDF1brl29sZ5RuJp/ia/09aXl5wGsA
 hkXBs7OC/tKgzxyTjtl5E/AEUDOCCbscxazO8ldpRTLtpyNB5Ie+KrsMs/slv1XCPoV/
 +Tg0HntHjtUl5kHmcPZaoh32rQfUrnt40jhc5z0uX2guDIfaxvKdNdKnxpgpqw2hhuJJ
 1/4A==
X-Gm-Message-State: APjAAAWws3bfgdvwMzY56Rhbz6x5zFrDSkTMfyDSBorY4CumPMfkBlSB
 ea8kg4xsrGU1698gEVIGM0p8Wg==
X-Google-Smtp-Source: APXvYqzLtG4aKWNi47QJ/hPlVUMMLxIfwxSEMy49K4k+vXzFRpzEt1nuNu5niWJIjA0BJoHCB8jbrA==
X-Received: by 2002:a17:90a:5884:: with SMTP id
 j4mr93042999pji.142.1564006665651; 
 Wed, 24 Jul 2019 15:17:45 -0700 (PDT)
Received: from ?IPv6:2620:0:1000:2514:1b4a:f4aa:2d85:6656?
 ([2620:0:1000:2514:1b4a:f4aa:2d85:6656])
 by smtp.gmail.com with ESMTPSA id j15sm69436434pfn.150.2019.07.24.15.17.44
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 15:17:45 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20190722194439.161904-1-smuckle@google.com>
 <20190723110306.GB22630@rei.lan>
 <1be1f0b8-170a-ac92-b86f-924e2d7f2295@google.com>
 <20190724115735.GC17426@rei.lan>
From: Steve Muckle <smuckle@google.com>
Message-ID: <75ded79c-da38-b648-fcfd-a423cc5f0e89@google.com>
Date: Wed, 24 Jul 2019 15:17:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724115735.GC17426@rei.lan>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/statx01: loosen the stx_blocks check
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
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 7/24/19 4:57 AM, Cyril Hrubis wrote:
> Hi!
>>> Why 128?
>>
>> Was just restoring it to what it was previously.
>>
>>> Can't we rather multiply the buff.stx_blksize/512 by 16?
>>
>> That would work for ext4, but should this be loosened further to give
>> some headroom in case some FS preallocates more? Or is it preferable to
>> keep the test as strict as possible and loosen it when/if failures happen?
> 
> That is hard to decide. I would go for the lowest limit that works for
> everybody.
> 
> Also for me ext4 allocates only one block for the file no matter what I
> do, something has to be tuned differently in your setup.
> 
> Isn't it just a difference in the block size and inode size?

On my platform stx_blocks = 16 (8kb) and stx_blksize = 4096, so two fs 
blocks are being allocated.

Interestingly, if I create a 256 byte file on this Android platform in 
/data, it 4kb:

vsoc_x86:/data # dd if=/dev/zero of=test_file bs=1 count=256
256+0 records in
256+0 records out
256 bytes (256 B) copied, 0.000926 s, 270 K/s
vsoc_x86:/data # ls -ls test_file
4 -rw-rw-rw- 1 root root 256 2019-07-24 19:28 test_file

However if I go into the directory specified in TMPDIR, it takes 8kb:

vsoc_x86:/data/local/tmp # dd if=/dev/zero of=test_file bs=1 count=256
256+0 records in
256+0 records out
256 bytes (256 B) copied, 0.000927 s, 270 K/s
vsoc_x86:/data/local/tmp # ls -ls
total 8
8 -rw-rw-rw- 1 root root 256 2019-07-24 19:30 test_file

It is also 8kb if I create it in /data/local, but not if I create a 
directory at /data/testdir and create the file there.

Perhaps the x-attributes are spilling out of the inode in some cases and 
into a data block? I don't know enough about filesystems to say.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
