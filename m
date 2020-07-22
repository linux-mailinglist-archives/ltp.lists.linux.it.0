Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D9822AB7B
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 11:12:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 582FD3C4D57
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 11:12:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 52A0F3C2466
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 18:17:11 +0200 (CEST)
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 93B83140171D
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 18:17:10 +0200 (CEST)
Received: by mail-il1-x142.google.com with SMTP id h16so1770110ilj.11
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 09:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tcL+fVRHFbwjcT2YoeEyW0ovDsmOpco9f4REaf4pOLw=;
 b=Yubxcjwtpc7YJGf0Tziz+sT7J49N0W4XOpcuP6qz+/oiMJmZWQU/Kd8bRbKoKhkvRZ
 RnULiCwqMICOqU1HdOr0DGkfNUWsljA27n+XJ+U5D4l98CuiRYbkSXMPr4+W0DyFNtb+
 AY+GHqK5P2TwUgTqNVgFJTxJoi0sTaFqqe+6N0p/LenOodA1YiaVIgE+e2BMkKkM402X
 R4n2L8/Xi3rrf4jYh3bII4QM3zJZ2tIZWJ5l8SbQpLT5zkqRCfn06WbbJYUNLuUFZK79
 2WjQU9hbziDqo4arXlFdwyZ0UC8MY80G8CFPHzWB/TsG+e4NxODiBVUvc4xDIlT2n9fa
 B76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tcL+fVRHFbwjcT2YoeEyW0ovDsmOpco9f4REaf4pOLw=;
 b=cY5C83necw1jrIoq6vK/tqV/54ptLME4c+fetHX1zyJc3WY4cL1o0/wCU16wMrIIIN
 i0pbeVNdFJpBKwcFSDVHQF6yhMIfG8IC6trjuE+c5FG461seJ3qbmOMOOTB0h8a2Nazu
 v64/RwZJSthgmtvZBNOKr3OqlVoOLxYca3i0ZIZ+WieSArS0PGagp+k7ymiQ8mNnkbEH
 BKjQ1fclv4UykL1PU5qjBk5UFLjfSM6re8XEtl6/suLI0kQur7mIBn8w2btU1N9Oiw3b
 DsROxY9sCU/c/1gDcJnRzZB3HOyJiyH9QtKLq9UtwTMwz0RSczFcgqzOi1+fIyiYyGei
 g40Q==
X-Gm-Message-State: AOAM532YOjj+Rs4UN5+++tNdK5O6IwrARZu9QeTIr76dPTmTiQAJbZrF
 0tIG9aXO0IcmgAUiKweNV+HBNuOwsWBEpBhnDUEZ1w==
X-Google-Smtp-Source: ABdhPJzRjVSHUdq95L4uwyL/QiKe4BnlIZ7BNNuAXtthqySJmpzNdrp3+RktG+FL20eMYaBBJOPnsGSirp9tKRuuYbA=
X-Received: by 2002:a92:404e:: with SMTP id n75mr615859ila.203.1595434629062; 
 Wed, 22 Jul 2020 09:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYuj3bHUMz8XQztbmTgF0c5+rZ5-FkUjFyvEftej2jLT+Q@mail.gmail.com>
 <CAK8P3a3br1bDc8C6UjRWzdmwzVV26YYe3ixHV7LH5Z0-OiqPQQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3br1bDc8C6UjRWzdmwzVV26YYe3ixHV7LH5Z0-OiqPQQ@mail.gmail.com>
Date: Wed, 22 Jul 2020 09:16:57 -0700
Message-ID: <CALvZod5cBTsytQz5=EbqT_s1_ZJ8YpkBe+CLEAU+25FP4kHSAg@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 23 Jul 2020 11:11:59 +0200
Subject: Re: [LTP] BUG at mm/vmalloc.c:3089! - invalid opcode: 0000 [#1] SMP
 KASAN PTI
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
From: Shakeel Butt via ltp <ltp@lists.linux.it>
Reply-To: Shakeel Butt <shakeelb@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Uladzislau Rezki \(Sony\)" <urezki@gmail.com>,
 David Hildenbrand <david@redhat.com>, Yafang Shao <laoar.shao@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Matthew Wilcox <willy@infradead.org>,
 Joerg Roedel <jroedel@suse.de>, Dennis Zhou <dennis@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>, Cgroups <cgroups@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Oleksiy Avramchenko <oleksiy.avramchenko@sonymobile.com>,
 Roman Gushchin <guro@fb.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Jul 22, 2020 at 1:55 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Adding Roman Gushchin to Cc, he touched that code recently.
>
> Naresh, if nobody has any immediate ideas, you could double-check by
> reverting these commits:
>
> e0b8d00b7561 mm: memcg/percpu: per-memcg percpu memory statistics
> 99411af13595 mm/percpu: fix 'defined but not used' warning
> 9398ce6306b6 mm-memcg-percpu-account-percpu-memory-to-memory-cgroups-fix-fix
> 54116d471779 mm-memcg-percpu-account-percpu-memory-to-memory-cgroups-fix
> ec518e090843 mm: memcg/percpu: account percpu memory to memory cgroups
> 9bc897d18dc3 percpu: return number of released bytes from pcpu_free_area()
>
>        Arnd
>

I think syzbot has bisected this issue to the suspect patch.

https://lore.kernel.org/lkml/00000000000043f09405ab01b0b8@google.com/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
