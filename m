Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BDEAFAAA5
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jul 2025 06:55:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E81F3C6653
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jul 2025 06:55:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D916E3C2365
 for <ltp@lists.linux.it>; Mon,  7 Jul 2025 06:55:07 +0200 (CEST)
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 62E99140025A
 for <ltp@lists.linux.it>; Mon,  7 Jul 2025 06:55:05 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bbBkF1L2pzYQvJ1
 for <ltp@lists.linux.it>; Mon,  7 Jul 2025 12:55:01 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
 by mail.maildlp.com (Postfix) with ESMTP id 0847C1A198F
 for <ltp@lists.linux.it>; Mon,  7 Jul 2025 12:55:00 +0800 (CST)
Received: from [10.174.179.80] (unknown [10.174.179.80])
 by APP3 (Coremail) with SMTP id _Ch0CgAXeCUgU2toTragAw--.41097S3;
 Mon, 07 Jul 2025 12:54:57 +0800 (CST)
Message-ID: <021aad1d-61ba-484f-88d1-9a482707ff94@huaweicloud.com>
Date: Mon, 7 Jul 2025 12:54:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jan Kara <jack@suse.cz>
References: <CA+G9fYsyYQ3ZL4xaSg1-Tt5Evto7Zd+hgNWZEa9cQLbahA1+xg@mail.gmail.com>
 <2dbc199b-ef22-4c22-9dbd-5e5876e9f9b4@huaweicloud.com>
 <CA+G9fYv5zpLxeVLqYbDLLUOxmAzuXDbaZobvpCBBBuZJKLMpPQ@mail.gmail.com>
 <1c7ae5cb-61ad-404c-950a-ba1b5895e6c3@huaweicloud.com>
 <c2dvcablaximwjnwg67spegwkntxjgezu6prvyyto4vjnx6rvh@w3xgx4jjq4bb>
Content-Language: en-US
From: Zhang Yi <yi.zhang@huaweicloud.com>
In-Reply-To: <c2dvcablaximwjnwg67spegwkntxjgezu6prvyyto4vjnx6rvh@w3xgx4jjq4bb>
X-CM-TRANSID: _Ch0CgAXeCUgU2toTragAw--.41097S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAryUZw4ktrW5WF18KF47CFg_yoWrXr43pF
 W3KF45uFWUWr40grn2qa17tF1Ut3yFqr4UXr98Gr9xu3Z8t3WfCr4Igw4j9Fy7tr4xGw4v
 qw4DK3sruFyqvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
 0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
 6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
 14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
 8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
 ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
 0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1
 7KsUUUUUU==
X-CM-SenderInfo: d1lo6xhdqjqx5xdzvxpfor3voofrz/
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] next-20250626: WARNING fs jbd2 transaction.c
 start_this_handle with ARM64_64K_PAGES
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
Cc: Theodore Ts'o <tytso@mit.edu>,
 Linux Regressions <regressions@lists.linux.dev>, Arnd Bergmann <arnd@arndb.de>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Dan Carpenter <dan.carpenter@linaro.org>, linux-fsdevel@vger.kernel.org,
 linux-ext4 <linux-ext4@vger.kernel.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2025/7/4 19:17, Jan Kara wrote:
> On Thu 03-07-25 19:33:32, Zhang Yi wrote:
>> On 2025/7/3 15:26, Naresh Kamboju wrote:
>>> On Thu, 26 Jun 2025 at 19:23, Zhang Yi <yi.zhang@huaweicloud.com> wrote:
>>>> On 2025/6/26 20:31, Naresh Kamboju wrote:
>>>>> Regressions noticed on arm64 devices while running LTP syscalls mmap16
>>>>> test case on the Linux next-20250616..next-20250626 with the extra build
>>>>> config fragment CONFIG_ARM64_64K_PAGES=y the kernel warning noticed.
>>>>>
>>>>> Not reproducible with 4K page size.
>>>>>
>>>>> Test environments:
>>>>> - Dragonboard-410c
>>>>> - Juno-r2
>>>>> - rk3399-rock-pi-4b
>>>>> - qemu-arm64
>>>>>
>>>>> Regression Analysis:
>>>>> - New regression? Yes
>>>>> - Reproducibility? Yes
>>>>>
>>>>> Test regression: next-20250626 LTP mmap16 WARNING fs jbd2
>>>>> transaction.c start_this_handle
>>>>>
>>>>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>>>>
>>>> Thank you for the report. The block size for this test is 1 KB, so I
>>>> suspect this is the issue with insufficient journal credits that we
>>>> are going to resolve.
>>>
>>> I have applied your patch set [1] and tested and the reported
>>> regressions did not fix.
>>> Am I missing anything ?
>>>
>>> [1] https://lore.kernel.org/linux-ext4/20250611111625.1668035-1-yi.zhang@huaweicloud.com/
>>>
>>
>> Hmm. It seems that my fix for the insufficient journal credit series
>> cannot handle cases with a page size of 64k. The problem is the folio
>> size can up to 128M, and the 'rsv_blocks' in ext4_do_writepages() can
>> up to 1577 on 1K block size filesystems, this is too large.
> 
> Firstly, I think that 128M folios are too big for our current approaches
> (in ext4 at least) to sensibly work. Maybe we could limit max folio order
> in ext4 mappings to max 1024 blocks per folio or something like that? For
> realistic setups with 4k blocksize this means 4M folios which is not really
> limiting for x86. Arm64 or ppc64 could do bigger but the gain for even
> larger folios is diminishingly small anyway.

Yeah, I agree.

> 
> Secondly, I'm wondering that even with 1577 reserved blocks we shouldn't
> really overflow the journal unless you make it really small. But maybe
> that's what the test does...

Yes, the test creates a filesystem image with a block size of 1 KB and a
journal consisting of 1024 blocks.

> 
>> Therefore, at this time, I think we should disable the large folio
>> support for 64K page size. Then, we may need to reserve rsv_blocks
>> for one extent and implement the same journal extension logic for
>> reserved credits.
>>
>> Ted and Jan, what do you think?
> 
> I wouldn't really disable it for 64K page size. I'd rather limit max folio
> order to 1024 blocks. That actually makes sense as a general limitation of
> our current implementation (linked lists of bhs in each folio don't really
> scale). We can use mapping_set_folio_order_range() for that instead of
> mapping_set_large_folios().
> 

Indeed, after noticing that Btrfs also calls mapping_set_folio_order_range()
to set the maximum size of a folio, I thought this solution should work. So
I changed my mind and was going to try this solution. However, I guess limit
max folio order to 1024 blocks is somewhat too small. I'd like to limit the
order to 2048 blocks, because this this allows a file system with a 1KB
block size to achieve a maximum folio size to PMD size in x86 with a 4KB
page size, this is useful for increase the TLB efficiency and reduce page
fault handling overhead.

I defined a new macro, something like this:

/*
 * Limit the maximum folio order to 2048 blocks to prevent overestimation
 * of reserve handle credits during the folio writeback in environments
 * where the PAGE_SIZE exceeds 4KB.
 */
#define EXT4_MAX_PAGECACHE_ORDER(i)             \
                min(MAX_PAGECACHE_ORDER, (11 + (i)->i_blkbits - PAGE_SIZE))

What do you think?

Best regards,
Yi.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
