Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A2D19E5E8
	for <lists+linux-ltp@lfdr.de>; Sat,  4 Apr 2020 16:40:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4F4CB3C2F06
	for <lists+linux-ltp@lfdr.de>; Sat,  4 Apr 2020 16:40:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 1603E3C2EF1
 for <ltp@lists.linux.it>; Sat,  4 Apr 2020 16:40:55 +0200 (CEST)
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 63E191000B66
 for <ltp@lists.linux.it>; Sat,  4 Apr 2020 16:40:55 +0200 (CEST)
Received: by mail-lf1-x143.google.com with SMTP id z23so8192341lfh.8
 for <ltp@lists.linux.it>; Sat, 04 Apr 2020 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8faSeldjtI+4HFEzjeUHGgbLGHXUu/xpOsQaYuJ9g28=;
 b=WJrqUFpx5yHDorppFEmuHGbZp9wmrNVH1xgFYuDM8zSF7JRkZhTw1SDn+/3L/1B8FG
 JyDLeZdodntAqW9D4/fPcI5vjnfm1j5q9BbPxoyjT3KMcUu93Zaz0CouaiqcmyV73d2Z
 cpX2rHOeoo1zRRgqGcIowBLGK4QQ+aeCZ/txK1DE9CE8gYBL5SDpixa0toB0UqJ8Sio3
 r2O2qIcdYuVs49jSOHgdPb5YWIesIkke3aAGIfjGWBK88B8ES59xBEckWkUm0rEumEOH
 tfKiRURO0+9bmFsb6N4cFj6p2VWQs3xnInwzZBgMyspaTxrFPembhsHjifNjoqL41V7s
 H+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8faSeldjtI+4HFEzjeUHGgbLGHXUu/xpOsQaYuJ9g28=;
 b=Bkj/T8W3KB1gOP9zKWTHEeHaPXR7/+dUGaThbsf0f+JBshjKTYuS4nEQmJAFMhpccL
 tY2q5zQcAua97BeJkipdqkHSD/2kyW6wlmKnbYvoTH/zZPf740cLlzLDn36U1OPR9Lnx
 jaK71VUoi6zQVJ+nqf09CVyZJ5suHLt4WDHpj9egqdGjsFBkiX+j/UpczAOqUCEj5DF5
 mIRvniWF9rlCEj1DYrXoBem4appUyMmEHatxKw2umb8XDv9V0kjWv0lA9+k6WoQ1tshX
 Ck9101bsFMRd6Feb2nMXKwuxyjixVjwjDZMegQc6AeKI4LxnLbeVCtnVKqnXvnWnuOCh
 3abg==
X-Gm-Message-State: AGi0Pua6Qo9kQEqZsWtVWu3hcKOsnW2vHQqbHcwHPpHKRKs/aDg15+LQ
 5tVL9TMGMwfGh2rAvC3kP5/em3dwLyQ251xr75NmpQ==
X-Google-Smtp-Source: APiQypJpSaClV6FqEIuZP6vtdkuCgEtD4FWzFqNcyGeR4Poy0Gs6lJYLiYinS/QYqPwqS/BFQknStkonA7iP4245SOQ=
X-Received: by 2002:ac2:44c6:: with SMTP id d6mr4573588lfm.26.1586011254618;
 Sat, 04 Apr 2020 07:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYs1xStrrsvGbW7bc4h1a0Kjfz0_zn4c7LL7-bGZb0GH6g@mail.gmail.com>
 <20200402133849.mmkvekzx37kw4nsj@box>
 <CA+G9fYv0xNtnD=eBmxVqYqEoYTbMk6mdn04WmgSUasDw2L7uFg@mail.gmail.com>
 <20200403133252.ivdqoppxhc6w5b47@box>
In-Reply-To: <20200403133252.ivdqoppxhc6w5b47@box>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sat, 4 Apr 2020 20:10:42 +0530
Message-ID: <CA+G9fYsnD0vkCpSH98Lpsi6nxXBS+JYbSPhTnNE16CrQ4s4QhQ@mail.gmail.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] mm/mremap.c : WARNING: at mm/mremap.c:211
 move_page_tables+0x5b0/0x5d0
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
Cc: William Kucharski <william.kucharski@oracle.com>,
 Julia Lawall <Julia.Lawall@lip6.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Will Deacon <will.deacon@arm.com>, linux- stable <stable@vger.kernel.org>,
 Michal Hocko <mhocko@kernel.org>, linux-mm <linux-mm@kvack.org>,
 lkft-triage@lists.linaro.org,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Andrew Morton <akpm@linux-foundation.org>, LTP List <ltp@lists.linux.it>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, 3 Apr 2020 at 19:02, Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> On Fri, Apr 03, 2020 at 12:56:57AM +0530, Naresh Kamboju wrote:
> > [  734.876355] old_addr: 0xbfe00000, new_addr: 0xbfc00000, old_end: 0xc0000000
>
> The ranges are overlapping. We don't expect it. mremap(2) never does this.
>
> shift_arg_pages() only moves range downwards. It should be safe.
>
> Could you try this:

Applied the patch and tested and still getting kernel warning.
CONFIG_HIGHMEM64G=y is still enabled.

[  790.041040] ------------[ cut here ]------------
[  790.045664] WARNING: CPU: 3 PID: 3195 at mm/mremap.c:212
move_page_tables+0x7a7/0x840
[  790.053486] Modules linked in: x86_pkg_temp_thermal
[  790.058358] CPU: 3 PID: 3195 Comm: true Tainted: G        W
5.6.2-rc1+ #15
[  790.065915] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.0b 07/27/2017
[  790.073386] EIP: move_page_tables+0x7a7/0x840
[  790.077737] Code: 9f 84 c0 0f 84 b7 fc ff ff 89 c3 e9 ba fe ff ff
8b 40 54 8b 40 10 8b 40 1c 8b 80 20 02 00 00 8b 40 0c 8b 50 08 83 c2
0c eb a7 <0f> 0b e9 55 fd ff ff 8d 45 d8 83 4d e8 01 e8 c6 e6 01 00 e9
ac f8
[  790.096475] EAX: bfe00000 EBX: 00200000 ECX: 07606001 EDX: 07606000
[  790.102732] ESI: c64c0010 EDI: c7606ff8 EBP: c845de14 ESP: c845dd7c
[  790.108989] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010206
[  790.115764] CR0: 80050033 CR2: b7e13b50 CR3: 064c0000 CR4: 003406f0
[  790.122024] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[  790.128281] DR6: fffe0ff0 DR7: 00000400
[  790.132111] Call Trace:
[  790.134558]  setup_arg_pages+0x22c/0x350
[  790.138514]  ? strlcpy+0x33/0x50
[  790.141776]  load_elf_binary+0x352/0x1010
[  790.145788]  ? selinux_inode_permission+0xe5/0x1f0
[  790.150573]  search_binary_handler+0x77/0x1a0
[  790.154931]  __do_execve_file+0x5aa/0x710
[  790.158935]  sys_execve+0x21/0x30
[  790.162246]  do_fast_syscall_32+0x75/0x260
[  790.166336]  entry_SYSENTER_32+0xa5/0xf8
[  790.170254] EIP: 0xb7f12c11
[  790.173045] Code: Bad RIP value.
[  790.176266] EAX: ffffffda EBX: bfc687d0 ECX: 08069420 EDX: bfc68a34
[  790.182548] ESI: 080599d4 EDI: bfc687d9 EBP: bfc68878 ESP: bfc687a8
[  790.188808] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000296
[  790.195585] ---[ end trace e8f9014a5c1de460 ]---

full test log,
https://lkft.validation.linaro.org/scheduler/job/1339582#L9858

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
