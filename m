Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 074831C259C
	for <lists+linux-ltp@lfdr.de>; Sat,  2 May 2020 15:17:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57D1A3C28E1
	for <lists+linux-ltp@lfdr.de>; Sat,  2 May 2020 15:17:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0ACEE3C27FC
 for <ltp@lists.linux.it>; Sat,  2 May 2020 15:17:20 +0200 (CEST)
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3E34E1A00EEF
 for <ltp@lists.linux.it>; Sat,  2 May 2020 15:17:20 +0200 (CEST)
Received: by mail-il1-x141.google.com with SMTP id e8so6902863ilm.7
 for <ltp@lists.linux.it>; Sat, 02 May 2020 06:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CEqDFYv9xq0ZcBtHGwgu1bxDLtAypgc7Gp9DqaMDhr4=;
 b=vesJFivSmsXOAwIt4I2t+cj23QorUgJGtdP6TbtDQYZfeEpl4mr01ERHZIMnby66dH
 UqdJsafYBgnYH0qrzcowwmw3koDjFFitVVeDLT4ajVMsbGk4UFRtvC1t/TQyi1f85jJJ
 n8EOm6NaQfyuTomDnsld5srIYnvKfMw1xlEzOVPvA+E9y0Yqo1Bk3yIbc+g1NSMouqtR
 0FaNVRvjghrWxHkm8KzPsR64w6BF/Mv8I+97rEg46jicfZTtq7Or6tT+X9/OOjEtH8Iy
 cBjWcuSW8ZX9pfL2ByNFhwZz8NkW1AESx0PztfIk2tJJaf6EbhNx9b+bnaucWKDP+4PS
 bJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CEqDFYv9xq0ZcBtHGwgu1bxDLtAypgc7Gp9DqaMDhr4=;
 b=PbLysWBC/HXtkQHUv5bLtfOVGag2Wy5Z8b1mGQRS3Qzqln7QBd3iQEazo0IMcC5Cl0
 SaPGO9h9zy/cK+WX8/YjBKLo0iY1hIixHdDD3UXUyTyMXtg45YyJvvGcoPN8+D7fQ6Qe
 5Swi1b23Sp5nUBBfC4NSBU0TatvPgmihoUxndWOLKOxQi8kLj2jI1M06zz8MWo5ykO+Z
 GptysPHdh50n7SEsWeUXqzOW8stxFmCKllIfyCc12kD4fHyylWiDKrJA8uCwr5YGggzW
 cTaQAvv6jt46SXBhC+exXwuVDGiM2kLqbycl2qL2rseS2GEOzOug5y1FVlRJyT8TIHZa
 1/hw==
X-Gm-Message-State: AGi0PuafXQJY60bpAznPstgM06JTOLhMwOceVp/9h66mhzeh9JiiGh0Z
 2tX0R4jVS6SBVP16IyGM9jKcumZGZV5d7jN902o=
X-Google-Smtp-Source: APiQypJQNnZM3HdD7Dy6IA8HtPhZeAP8pJuKEQ+dcVuQEs1EQJ6785FifsEEE0qwcEW5FRkfH/0SYBxnex/JUpAohOM=
X-Received: by 2002:a92:9e11:: with SMTP id q17mr8432776ili.137.1588425439013; 
 Sat, 02 May 2020 06:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200421065002.12417-1-amir73il@gmail.com>
 <20200421065002.12417-4-amir73il@gmail.com>
 <20200502070956.GA1649@morpheus.bobrowski.net>
In-Reply-To: <20200502070956.GA1649@morpheus.bobrowski.net>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 2 May 2020 16:17:07 +0300
Message-ID: <CAOQ4uxiiY8XWWvuSfVre2cKkCDGn0rVj4OJ9umtUyn4o-QUhxQ@mail.gmail.com>
To: Matthew Bobrowski <mbobrowski@mbobrowski.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/4] syscalls/fanotify15: Add a test case for
 inode marks
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
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Sat, May 2, 2020 at 10:10 AM Matthew Bobrowski
<mbobrowski@mbobrowski.org> wrote:
>
> On Tue, Apr 21, 2020 at 09:50:01AM +0300, Amir Goldstein wrote:
> > +     tst_res(TINFO,
> > +             "Test #%d: FAN_REPORT_FID with mark type: %s",
> > +             number, mark->name);
> >
> > -     if (fanotify_mark(fanotify_fd, FAN_MARK_ADD | FAN_MARK_FILESYSTEM,
> > +
>
> A nit, but there's an unnecessary extra whiteline here.
>
> > +     if (fanotify_mark(fanotify_fd, FAN_MARK_ADD | mark->flag, tc->mask |
> >                               FAN_CREATE | FAN_DELETE | FAN_MOVE |
> > -                             FAN_MODIFY | FAN_DELETE_SELF | FAN_ONDIR,
> > +                             FAN_MODIFY | FAN_ONDIR,
> >                               AT_FDCWD, TEST_DIR) == -1) {
> >               if (errno == ENODEV)
> >                       tst_brk(TCONF,
> >                               "FAN_REPORT_FID not supported on %s "
> >                               "filesystem", tst_device->fs_type);
> >               tst_brk(TBROK | TERRNO,
> > -                     "fanotify_mark(%d, FAN_MARK_ADD | FAN_MARK_FILESYSTEM, "
> > +                     "fanotify_mark(%d, FAN_MARK_ADD | %s, "
> >                       "FAN_CREATE | FAN_DELETE | FAN_MOVE | "
> > -                     "FAN_MODIFY | FAN_DELETE_SELF | FAN_ONDIR, "
> > +                     "FAN_MODIFY | FAN_ONDIR, "
> >                       "AT_FDCWD, %s) failed",
> > -                     fanotify_fd, TEST_DIR);
> > +                     fanotify_fd, mark->name, TEST_DIR);
>
> I see that you've removed the FAN_DELETE_SELF mask here, although
> should we consider adding tc->mask here too for the sake of
> correctness?

Sure, I added " | 0x%x" for the extra tc->mask and also
enhanced the TINFO in the beginning of the test case to disaply
more explicit text like this:
               "FAN_REPORT_FID on filesystem including FAN_DELETE_SELF",
               "FAN_REPORT_FID on directory with FAN_EVENT_ON_CHILD",

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
