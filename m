Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E753DFB2B
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 07:40:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A0D723C65B1
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 07:40:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 08ACD3C65B1
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 07:40:07 +0200 (CEST)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2C08B200C7A
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 07:40:07 +0200 (CEST)
Received: by mail-io1-xd30.google.com with SMTP id z7so1104718iog.13
 for <ltp@lists.linux.it>; Tue, 03 Aug 2021 22:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4eWkAtXPKjUx8eSu0DoN0DWy+n6qfJjTgsRsQt2pWwI=;
 b=T7BYM1K/SBR8dMsVZh12AAZBuDhYnvnXCyWHgO5m8L7OxlLeLf7NRxxP+4y/wRqP1H
 CxIRJ1hAJplCVl+By29zOyxFCyio5TNhQLGCS20ocFUTmp4udxKjyDplntjhqRpzQ5Zc
 K4pBJe38dMvXJxCd11DDGI14Sgbk0JtDzR44c+SrNMLNbKvJ1iDsni3jjRp75QylvdUP
 /WHBL3abL6D+wNzvcP1amqP0EvZ3LqJViRvMzf7XujR8Dt1duNTQkmLRahL71JrBbo/v
 oNPEKcB+fA1tDYX98I6bw0Ml/5QPEAE8gQgbWx5EasjbQSf7DKIREO9y7CkddqRCdncK
 HxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4eWkAtXPKjUx8eSu0DoN0DWy+n6qfJjTgsRsQt2pWwI=;
 b=dn4Fd3OyMlwvbG42TDPBs5LL/V+fr+AIAeYF8BPjyKDPXDiOV8JPvAqyEKa7IfuXfq
 abJ4WBmXbrV9Czo0PdjCSjBIenp8FReZZP+bFZ2AZJjMGQNGan3391Z/59OsDDuYXCdq
 HvB+PBclKtLD4d9E52sfBY6ti6CxI2ubmSUavguwIhZALw3p+lCoK5EQQAegvU4R6rLV
 ZweLrG2OmuGUzJvS2cxMFAjZPW0rO0BqSpt0YRRgkHRfY1dvzfiyEMVMD3SRqu4j2+j0
 2yVoovJETdigpbgNOwletae5BnmAcRU1cRQwHseB4KSFBWU6PT4AjBrtQzBwn/OxS1JM
 sTuQ==
X-Gm-Message-State: AOAM533Lr6jnfdJxBAa++fVbbhmK/dE8/awEz5WJ3SMJYmrLQZGBZiFH
 P8dyTVYeieRDfFWivT7rpqgcGSe2b/gPchN3kTU=
X-Google-Smtp-Source: ABdhPJyFmWoGMs/fdPjycryXrJITJGj+y+ZlX9+k1TgrW9dTzOFeFdUwFQHbcfOmyDvzpkcnOEXi50+wa6og/frFwgY=
X-Received: by 2002:a5e:9901:: with SMTP id t1mr308948ioj.5.1628055606081;
 Tue, 03 Aug 2021 22:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210802214645.2633028-1-krisman@collabora.com>
 <20210802214645.2633028-4-krisman@collabora.com>
 <CAOQ4uxjMfJM4FM4tWJWgjbK4a2K1hNJdEBRvwQTh9+5su2N0Tw@mail.gmail.com>
 <87fsvphksu.fsf@collabora.com>
In-Reply-To: <87fsvphksu.fsf@collabora.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 4 Aug 2021 08:39:55 +0300
Message-ID: <CAOQ4uxj_WwDPxZv0nr9+Hh+pim6+2onaBdFq_BR-qK=xz+8yUg@mail.gmail.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/7] syscalls/fanotify20: Validate incoming FID in
 FAN_FS_ERROR
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
Cc: kernel@collabora.com, Khazhismel Kumykov <khazhy@google.com>,
 Matthew Bobrowski <repnop@google.com>, Jan Kara <jack@suse.com>,
 Ext4 <linux-ext4@vger.kernel.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Aug 4, 2021 at 7:54 AM Gabriel Krisman Bertazi
<krisman@collabora.com> wrote:
>
> Amir Goldstein <amir73il@gmail.com> writes:
>
> > On Tue, Aug 3, 2021 at 12:47 AM Gabriel Krisman Bertazi
> > <krisman@collabora.com> wrote:
> >>
> >> Verify the FID provided in the event.  If the testcase has a null inode,
> >> this is assumed to be a superblock error (i.e. null FH).
> >>
> >> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> >> ---
> >>  .../kernel/syscalls/fanotify/fanotify20.c     | 51 +++++++++++++++++++
> >>  1 file changed, 51 insertions(+)
> >>
> >> diff --git a/testcases/kernel/syscalls/fanotify/fanotify20.c b/testcases/kernel/syscalls/fanotify/fanotify20.c
> >> index fd5cfb8744f1..d8d788ae685f 100644
> >> --- a/testcases/kernel/syscalls/fanotify/fanotify20.c
> >> +++ b/testcases/kernel/syscalls/fanotify/fanotify20.c
> >> @@ -40,6 +40,14 @@
> >>
> >>  #define FAN_EVENT_INFO_TYPE_ERROR      4
> >>
> >> +#ifndef FILEID_INVALID
> >> +#define        FILEID_INVALID          0xff
> >> +#endif
> >> +
> >> +#ifndef FILEID_INO32_GEN
> >> +#define FILEID_INO32_GEN       1
> >> +#endif
> >> +
> >>  struct fanotify_event_info_error {
> >>         struct fanotify_event_info_header hdr;
> >>         __s32 error;
> >> @@ -57,6 +65,9 @@ static const struct test_case {
> >>         char *name;
> >>         int error;
> >>         unsigned int error_count;
> >> +
> >> +       /* inode can be null for superblock errors */
> >> +       unsigned int *inode;
> >
> > Any reason not to use fanotify_fid_t * like fanotify16.c?
>
> No reason other than I didn't notice they existed. Sorry. I will get
> this fixed.

No problem. That's what review is for ;-)

BTW, unless anyone is specifically interested I don't think there
is a reason to re post the test patches before the submission request.
Certainly not for the small fixes that I requested.

I do request that you post a link to a branch with the fixed test
so that we can experiment with the kernel patches.

I've also CC'ed Matthew who may want to help with review of the test
and man page that you posted in the cover letter [1].

Thanks,
Amir.

[1] https://lore.kernel.org/linux-ext4/20210802214645.2633028-1-krisman@collabora.com/T/#m9cf637c6aca94e28390f61deac5a53afbc9e88ae

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
