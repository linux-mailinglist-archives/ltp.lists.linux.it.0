Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA54248B61
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 18:20:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55DB43C2FF9
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 18:20:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id EE0DC3C2FE4
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 18:20:23 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D996C600043
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 18:20:22 +0200 (CEST)
Received: from mail-lf1-f71.google.com ([209.85.167.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1k84LV-0006Nw-MJ
 for ltp@lists.linux.it; Tue, 18 Aug 2020 16:20:21 +0000
Received: by mail-lf1-f71.google.com with SMTP id b16so4582280lfs.10
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 09:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x4GwT3xnF5AT8Z5oeCaLkvpC4q71iwp2+TAjbS25Khg=;
 b=T6hatUy/A/ir/CnMQSlDZRhuGeRIXFnOREjwengCdOOg62Xu7Cr9+z6V0QmxJ6NTd4
 TZIvR3QqLxsK9GJbfR7ewZ/uyBHO7YVxo61S9krW5QH4U+Jgfi+iLfM1S0uymUoKkoVd
 bAr1mSqHWj1lmNcC1DJ09szkkXP3EnSjm2NxzsiTNwxJGh6p8k2DLLmzqFH+nCYumt8n
 fHHZW54gaQaAKvkHQb+4h2fCsmpS4jGqnbC5gKjnZwZ5+XM6iLQprpihUOvAHNUHXWlI
 jp6Qcnxnya+bpI6Pq3SBs6ThUf90k4E5ZRiqGXk/zdRHLh7pR6sQgvxR3OlKM9JlLduU
 5DZw==
X-Gm-Message-State: AOAM530PvKwWKX6kWagow4bJs2xuS3F0QwLBxvLCTNPMY4NZ73mry3gX
 jXBIZuGsE784SE2PnhxkLKAbBP44DiacRPsd+8L6/wVMKXgnXlQkZozvjuQPvXPfBmAaFKfqJoa
 vgAHwGOjw9U3Hzptosa/2ewXim4f9bSm5J9k1c/NoFPI=
X-Received: by 2002:a05:651c:503:: with SMTP id
 o3mr10791184ljp.312.1597767620844; 
 Tue, 18 Aug 2020 09:20:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeg8s3doPvhaxJ7QkJ+bzve15/yF9hE5KBa8+SeVe1mENlc621lXyfb5Ig+2EfszGYXMSnDyoiJBX4JpF+5hM=
X-Received: by 2002:a05:651c:503:: with SMTP id
 o3mr10791124ljp.312.1597767619172; 
 Tue, 18 Aug 2020 09:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200818100422.27775-1-po-hsu.lin@canonical.com>
 <20200818100422.27775-2-po-hsu.lin@canonical.com>
 <20200818152941.GG27964@yuki.lan>
In-Reply-To: <20200818152941.GG27964@yuki.lan>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Wed, 19 Aug 2020 00:20:08 +0800
Message-ID: <CAMy_GT9kZbvC9=t9e2J4nrfW+vMHzK-DH2bU3=ZbkJepk4TrEQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCHv2 1/2] lib/tst_kvercmp: Add support to get
 distname for different OS in tst_kvcmp_distname
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Aug 18, 2020 at 11:29 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> >  static char *parse_digit(const char *str, int *d)
> >  {
> >       unsigned long v;
> > @@ -127,6 +130,8 @@ int tst_kvexcmp(const char *tst_exv, const char *cur_ver)
> >
> >  const char *tst_kvcmp_distname(const char *kver)
> >  {
> > +     static char distname[64];
> > +     char *tok;
> >       if (strstr(kver, ".el5uek"))
> >               return "OL5UEK";
> >
> > @@ -139,6 +144,17 @@ const char *tst_kvcmp_distname(const char *kver)
> >       if (strstr(kver, ".el6"))
> >               return "RHEL6";
> >
> > +     // Special case for other releases with the presencse of /etc/os-release
> > +     if (access(OSRELEASE_PATH, F_OK) != -1) {
> > +             SAFE_FILE_LINES_SCANF(NULL, OSRELEASE_PATH, "ID=%s", distname);
> > +             tok = strtok(distname,"\0");
>
> Isn't this strtok() useless?
Hello,
oh indeed, the delimiter in strtok will become null character anyway.
I think just tok = distname can do the trick here.
I will send v3 tomorrow.

Thank you


>
>
> Other than that the patchset looks fine.
>
> > +             while (*tok) {
> > +                     *tok = toupper((unsigned char) *tok);
> > +                     tok++;
> > +             }
> > +             return distname;
> > +     }
> > +
> >       return NULL;
> >  }
> >
> > --
> > 2.25.1
> >
>
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
