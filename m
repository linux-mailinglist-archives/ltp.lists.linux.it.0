Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 260B27F5C35
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Nov 2023 11:23:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DEB2B3CE06F
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Nov 2023 11:23:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2607C3CE086
 for <ltp@lists.linux.it>; Wed, 22 Nov 2023 18:20:01 +0100 (CET)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0244614001E6
 for <ltp@lists.linux.it>; Wed, 22 Nov 2023 18:19:58 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 414C93200B57;
 Wed, 22 Nov 2023 12:19:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 22 Nov 2023 12:19:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=devkernel.io; h=
 cc:cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1700673594; x=1700759994; bh=HB
 A8/PFg10ymZNJDZ693U+tza3MBCER8GemTUdFxOSY=; b=kB6PqRHMuOJq8+yRwk
 Apu+hG7KQ+/+RHI96oE3S0StgmKqV5mmf22tZOYHgW9hRlZpNdIkgzfLfY5fJLKY
 9P2zfPVBksW6U1pW2cmnlctW8bGx/o5h3Gw0VjIfjKGRThaDcPgDRNGqlsjMNcty
 Dh5qD/Z/HqG20rhZM41Pt+LaeaxmdI+VC0n97IFgo6S1i+22SLTKZ4zssVKemROE
 4vbp830JmNxWbSYcUlRBjx5dfciVR9erOEvF6wmTb/ecb8nYX2+wGSYTQgr5SOAO
 qeJuPvbmyS2VTTNO86Fvx3hitJhu0xaCPL4z5nU1qm9zzngdLJEGzhb+5RT6o/b2
 NwiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1700673594; x=1700759994; bh=HBA8/PFg10ymZ
 NJDZ693U+tza3MBCER8GemTUdFxOSY=; b=RwghFZzluA72h5rDesMsi5YLfssF1
 3QpqmD0qIBO6NwG3K27ii6vjYDhnf6dW3PbdCKsOJ1ZroqZFSSdlX/RFcn5bKfbD
 ADMkrUqWLSlNYcfErGTuW8NAbmf5MraM/qHMWEYeQMkHWSi8GaqRJsvymIhOx+0K
 9cDgwzOrodGUDtoFom9ndeyL9gQc8KHWWhk7SottR/8CRYQQTyDTTeS4L4Xk0N8t
 hk21090Sxex9EvyQ9+D+ZvEw+tvErD1R0zCBaKMST9tAvrmLNP9yCPtwVFxiWK0F
 RO9c2KRqkEU6UXRYa8gUXUV6h+wQ9M/ftfjW+sEr5jBklvUYMu8ulOyrQ==
X-ME-Sender: <xms:ODheZSK711yXzfijKj2B_yBjTSUX16HiWl3r4oIc6IXHwZVVAp7mvA>
 <xme:ODheZaJVSaGM9PXw3T9h2rw3ILQwiQp1sZ9nZMn0ypbs9w01PmgJT39dAbDnOvzoQ
 -8r-41C8o5gx2LO9Cw>
X-ME-Received: <xmr:ODheZSta4fNxw3YCa6Z0iFf09Mu_g3zq0gQWkBiTatoRe7_fgB_sN_oX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehuddgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 goteeftdduqddtudculdduhedmnecujfgurhepfhgfhffvvefuffgjkfggtgesthdtredt
 tdertdenucfhrhhomhepufhtvghfrghnucftohgvshgthhcuoehshhhrseguvghvkhgvrh
 hnvghlrdhioheqnecuggftrfgrthhtvghrnhepvdduhfdvffduvedvkedvffejvdejuedv
 feejtdejtefffeejgfelhfetkedtgeeknecuffhomhgrihhnpehkshhmtddupgdurdhfrg
 hilhdpkhgvrhhnvghlrdhorhhgpdhkshhmtddurdhfrghilhenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehshhhrseguvghvkhgvrhhnvghlrd
 hioh
X-ME-Proxy: <xmx:ODheZXZyffz4GkJdkTUFiCUsEVMAvWwdNM91jQU5dVZZ6BhNiNI7ww>
 <xmx:ODheZZaES0sNWBYMcb-ilagzdRnfsfZUYQy1w38KAjHImlfD_ocwrA>
 <xmx:ODheZTDUdLdzHlDIx0CQqQXkW1DGhjL7xcT7qRhvB94K-FNsmFS-WQ>
 <xmx:OjheZbkcTFFOEdBWdMYskZszXXXzSl9agWrw8pvICwlJTQPTzHQFDQ>
Feedback-ID: i84614614:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Nov 2023 12:19:50 -0500 (EST)
References: <202311161132.13d8ce5a-oliver.sang@intel.com>
 <3540fd3e-88dd-462b-88ce-df28b7b5b148@redhat.com>
 <87edgo8gq7.fsf@devkernel.io>
User-agent: mu4e 1.10.3; emacs 29.1
From: Stefan Roesch <shr@devkernel.io>
To: Stefan Roesch <shr@devkernel.io>
Date: Wed, 22 Nov 2023 09:16:47 -0800
In-reply-to: <87edgo8gq7.fsf@devkernel.io>
Message-ID: <877cm9so25.fsf@devkernel.io>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 23 Nov 2023 11:23:39 +0100
Subject: Re: [LTP] [linus:master] [mm/ksm] 5e924ff54d: ltp.ksm01.fail
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
Cc: lkp@intel.com, David Hildenbrand <david@redhat.com>,
 Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kernel test robot <oliver.sang@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, oe-lkp@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Stefan Roesch <shr@devkernel.io> writes:

> David Hildenbrand <david@redhat.com> writes:
>
>> On 16.11.23 05:39, kernel test robot wrote:
>>> hi, Stefan Roesch,
>>> we reported
>>> "[linux-next:master] [mm/ksm]  5e924ff54d: ltp.ksm01_1.fail"
>>> in
>>> https://lore.kernel.org/all/202311031548.66780ff5-oliver.sang@intel.com/
>>> when this commit is in linux-next/master.
>>> now we noticed this commit is merged in mainline, and we still observed
>>> same issue. just FYI.
>>> Hello,
>>> kernel test robot noticed "ltp.ksm01.fail" on:
>>> commit: 5e924ff54d088828794d9f1a4d5bf17808f7270e ("mm/ksm: add "smart" page
>>> scanning mode")
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>> [test failed on linus/master 3ca112b71f35dd5d99fc4571a56b5fc6f0c15814]
>>> [test failed on linux-next/master 8728c14129df7a6e29188a2e737b4774fb200953]
>>> in testcase: ltp
>>> version: ltp-x86_64-14c1f76-1_20230715
>>> with following parameters:
>>> 	disk: 1HDD
>>> 	test: mm-00/ksm01
>>> compiler: gcc-12
>>> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz (Kaby Lake) with 32G memory
>>> (please refer to attached dmesg/kmsg for entire log/backtrace)
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version
>>> of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>>> | Closes: https://lore.kernel.org/oe-lkp/202311161132.13d8ce5a-oliver.sang@intel.com
>>> Running tests.......
>>> <<<test_start>>>
>>> tag=ksm01 stime=1699563923
>>> cmdline="ksm01"
>>> contacts=""
>>> analysis=exit
>>> <<<test_output>>>
>>> tst_kconfig.c:87: TINFO: Parsing kernel config '/proc/config.gz'
>>> tst_test.c:1558: TINFO: Timeout per run is 0h 00m 30s
>>> mem.c:422: TINFO: wait for all children to stop.
>>> mem.c:388: TINFO: child 0 stops.
>>> mem.c:388: TINFO: child 1 stops.
>>> mem.c:388: TINFO: child 2 stops.
>>> mem.c:495: TINFO: KSM merging...
>>> mem.c:434: TINFO: resume all children.
>>> mem.c:422: TINFO: wait for all children to stop.
>>> mem.c:344: TINFO: child 1 continues...
>>> mem.c:347: TINFO: child 1 allocates 128 MB filled with 'a'
>>> mem.c:344: TINFO: child 2 continues...
>>> mem.c:347: TINFO: child 2 allocates 128 MB filled with 'a'
>>> mem.c:344: TINFO: child 0 continues...
>>> mem.c:347: TINFO: child 0 allocates 128 MB filled with 'c'
>>> mem.c:400: TINFO: child 1 stops.
>>> mem.c:400: TINFO: child 0 stops.
>>> mem.c:400: TINFO: child 2 stops.
>>> ksm_helper.c:36: TINFO: ksm daemon takes 2s to run two full scans
>>> mem.c:264: TINFO: check!
>>> mem.c:255: TPASS: run is 1.
>>> mem.c:255: TPASS: pages_shared is 2.
>>> ....
>>> mem.c:255: TPASS: pages_shared is 1.
>>> mem.c:255: TPASS: pages_sharing is 98302.
>>> mem.c:252: TFAIL: pages_volatile is not 0 but 1.     <-----
>>> mem.c:252: TFAIL: pages_unshared is not 1 but 0.     <-----
>>
>> @Stefan, is this simply related to the new scanning optimization (skip and
>> eventually not merge a pages within the "2 scans" windows, whereby previously,
>> they would have gotten merged)?
>>
>> If so, we might just want to disable that optimization for that test case?
>>
>> Alternatively, maybe we have to wait for "more" scan cycles instead of only 2?
>
> I'd expect this is caused by "smart scan", where we can skip pages.
> The best is probably to disable the smart scan feature for this test.
> The smart scan feature can be disabled by:
>
>     echo 0 > /sys/kernel/mm/ksm/smart_scan
>
> I'll have a look at it today.
>

If I disable "smart scan", the testcase completes successully. This is
simply the case that for the testcase, it can "skip" a page (as the
"smart scan" feature is enabled).

The easiest fix is to disable smart scan for the ksm cases. I'll send an
ltp patch a bit later to address this issue.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
