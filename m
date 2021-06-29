Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B173B7FF0
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 11:28:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 241F03C8D12
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 11:28:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 58D793C19D7
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 19:20:44 +0200 (CEST)
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6630E14002B0
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 19:20:43 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id g4so31893269qkl.1
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 10:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/g9C8vLCxpxetYHMmmvMHDZ4rkR3+uVlFuhnglVYRGo=;
 b=N+8FEgPL4LPJUkZytSvzXk/NQU+4fS/ebf+uSYnSGtsPwtD8ih41fxs9n77SFtBGLP
 7VHnDtzlurQ1uYpD7vYrN2tolMHqra0tJHyh08buGKbteTNjvBI9HQ0LMlXbzeT6r2tT
 Bi9ZVHSjJZv+IJoNbx0FkZKHyYIvROvfe3PXBHM9id4jYzEU3VtdCf4gw4CTSaMsQs0N
 UueeXQcOBcuEoHfF02D1oQ4DMwcIvkUuHcXfBf4lkSopQ+T/zhmxKRgtS1xY5bTWpzaH
 7CrV7goIoYP3cDDeu2o0lDqU1O2Y8BD8ybqETuUi5SjmEbvjVGHl9TTPdAxpDmC7vsVR
 wvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/g9C8vLCxpxetYHMmmvMHDZ4rkR3+uVlFuhnglVYRGo=;
 b=hN17zFX7yEQZ6rzbSy0beMrPCXgXUPRg/SLdkY+gTrzuFS/fbpFpr4lFojzNINuTYP
 8418zpjbER3HHN1fks7ZigCDYZ1mUT/dD/2uVR5xk0qPdOXW+YLs3geGuYcNlArFRDhT
 3mwyg0KYL1WFA0FToe5m+zVIEH/rmrTBXHl8CMe1fKdnsnGklwxtg6/hQGwByMYymUBX
 w87hUxrCG8IIBNsKbS/zyvRhHxRcVYjwVl+BF5eDCjiKlVUDNgBoU0ILSuu+6HoJap69
 h56fu1YkzUUxDbBbQ4Zi+gkkE761BSl1MvXPJ0/pyTJFzWYFGGB5IGnDJsPX7zodYAw1
 3PLw==
X-Gm-Message-State: AOAM531/5HHK/pW76hR8oH4VPvPjVRp5o3vzi59OJt2c8TmTehEYpOcJ
 qCkIT7NF8ymGK965mXjtcRPJBg==
X-Google-Smtp-Source: ABdhPJykOZcrDnmOCKaUJRp9PsIrPnZo/Uuby9MJ0DopNbFrV0OF9l8f9Gld8423jiQ3X6pEPQZHgQ==
X-Received: by 2002:a05:620a:248b:: with SMTP id
 i11mr7745403qkn.153.1624987242047; 
 Tue, 29 Jun 2021 10:20:42 -0700 (PDT)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com.
 [174.109.172.136])
 by smtp.gmail.com with ESMTPSA id d129sm12430058qkf.136.2021.06.29.10.20.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 10:20:41 -0700 (PDT)
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 linux-btrfs@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "kernel-team@lists.ubuntu.com" <kernel-team@lists.ubuntu.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>, Qu Wenruo <wqu@suse.com>,
 Filipe Manana <fdmanana@suse.com>
References: <a3b42abc-6996-ab06-ea9f-238e7c6f08d7@canonical.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <e4c71c01-ed70-10a6-be4d-11966d1fcb75@toxicpanda.com>
Date: Tue, 29 Jun 2021 13:20:40 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a3b42abc-6996-ab06-ea9f-238e7c6f08d7@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 30 Jun 2021 11:28:00 +0200
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 6/29/21 1:00 PM, Krzysztof Kozlowski wrote:
> Dear BTRFS folks,
> 
> I am hitting a potential regression of btrfs, visible only with
> fallocate05 test from LTP (Linux Test Project) only on 32+ core Azure
> instances (x86_64).
> 
> Tested:
> v5.8 (Ubuntu with our stable patches): PASS
> v5.11 (Ubuntu with our stable patches): FAIL
> v5.13 mainline: FAIL
> 
> PASS means test passes on all instances
> FAIL means test passes on other instance types (e.g. 4 or 16 core) but
> fails on 32 and 64 core instances (did not test higher),
> e.g.: Standard_F32s_v2, Standard_F64s_v2, Standard_D32s_v3,
> Standard_E32s_v3
> 
> Reproduction steps:
> git clone https://github.com/linux-test-project/ltp.git
> cd ltp
> ./build.sh && make install -j8
> cd ../ltp-install
> sudo ./runltp -f syscalls -s fallocate05
> 

This thing keeps trying to test ext2, how do I make it only test btrfs?  Thanks,

Josef

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
