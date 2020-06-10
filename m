Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8BC1F4BC5
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 05:26:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7C55A3C0660
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 05:26:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 3BABA3C01D9
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 05:26:52 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7812F1400E14
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 05:26:51 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id a127so469300pfa.12
 for <ltp@lists.linux.it>; Tue, 09 Jun 2020 20:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=c/8nKnea39qIx654metcjWHbo/RXXXVIqtibvPz5ZYM=;
 b=PGBLUXwHaKfemOPi4o5+IUDcQMy5aebEdBpOY+qSjAXPonxkO6no+s9bUW2/kTQsOU
 er2oX8aaXCOhweq3CCULoXJOXMbzTptA23WNlTqgyqnAh1uolzdKE4J4kdg2IZ5tK2ik
 3sYdVUusimnzY06jut2JDCm17wgw1uEAM75iqlKN9S2kUciu20SfP4RgGP6sb5dwYdk8
 XFjBREl6i9UsEMxCNGj4BnbprZZgLgx+Fa6aGergYx9J4Y1gHA85QgLHI/H7hIfXNnuw
 K/VdshZimvXgWyHtp7AEHu/2dE30XX7NDGXkWRzH3DwdCj6hFNlMUt4UvGI+nolHDYPe
 nGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=c/8nKnea39qIx654metcjWHbo/RXXXVIqtibvPz5ZYM=;
 b=M/d7AQ7ICcc4XT7SSvvfu4CCLgSUCy1V7KWLCZDDI6cubls8TFImt9ApDx+MeGFiD7
 hiiqkY26RqVnmVEt9kKREK/bzhrMSl0rpJcp92vKkqy/8Ts35uFR/eRs6puvllX1oje/
 uCe6hpu+FU7Al86gyf1MMEOcVhGG7OCAHNkjbrRu3R2EcraMm10rHxnZhhIHKx8ixHNw
 LmICZt0Mr69P5t2t7ghdSDezE//WsUkwTwGAeAith4cEzjoq8cN4jh9LykJM9hR8RI3t
 /8Yi3IoFDv1lhqBjdfh79DCpZEG7/U/5TttVtoyPpg/ooGZdpohyD/hP6EyjgP80i5WV
 fn2w==
X-Gm-Message-State: AOAM531Ge8v6/rlGj5EenWOwfKlCifhzzWM+PwH+RZ+zPGlZUsI3bbck
 R24mgndig8+5A0NyYzCOwpKAFw==
X-Google-Smtp-Source: ABdhPJy10syITSzCLbpgnEgh0uupzDa6J62dwHEMQYv95r+kOY0SdIq+9nP8VrGvdglVDmSqfcrQuw==
X-Received: by 2002:a63:1624:: with SMTP id w36mr1001135pgl.144.1591759609597; 
 Tue, 09 Jun 2020 20:26:49 -0700 (PDT)
Received: from localhost ([122.172.62.209])
 by smtp.gmail.com with ESMTPSA id d7sm11271542pfh.78.2020.06.09.20.26.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 20:26:48 -0700 (PDT)
Date: Wed, 10 Jun 2020 08:56:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200610032646.aucl5k7s7ssaqqpd@vireshk-i7>
References: <cover.1590144577.git.viresh.kumar@linaro.org>
 <a4a628a637a6eeeed4249656836bd217f5cbb9ac.1590144577.git.viresh.kumar@linaro.org>
 <CAEemH2eLNKKCdVvNFRFdU2-PDsXLZZmrh1gLH6bgMMFbrXi_Lg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2eLNKKCdVvNFRFdU2-PDsXLZZmrh1gLH6bgMMFbrXi_Lg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 01/17] syscalls/timer_gettime: Add support for
 time64 tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 09-06-20, 20:32, Li Wang wrote:
> On Fri, May 22, 2020 at 6:52 PM Viresh Kumar <viresh.kumar@linaro.org>
> wrote:
> 
> > This adds support for time64 tests to the existing timer_gettime()
> > syscall tests.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  include/tst_timer.h                           |  45 +++++++
> >  .../syscalls/timer_gettime/timer_gettime01.c  | 124 ++++++++----------
> >  2 files changed, 97 insertions(+), 72 deletions(-)
> >
> > diff --git a/include/tst_timer.h b/include/tst_timer.h
> > index 256e1d71e1bc..d9afbe0ece71 100644
> > --- a/include/tst_timer.h
> > +++ b/include/tst_timer.h
> > @@ -15,6 +15,7 @@
> >  #include <sys/time.h>
> >  #include <time.h>
> >  #include "tst_test.h"
> > +#include "lapi/common_timers.h"
> >  #include "lapi/syscalls.h"
> >
> >  /*
> > @@ -112,6 +113,16 @@ struct __kernel_timespec {
> >         __kernel_time64_t       tv_sec;                 /* seconds */
> >         long long               tv_nsec;                /* nanoseconds */
> >  };
> > +
> > +struct __kernel_old_itimerspec {
> > +       struct __kernel_old_timespec it_interval;    /* timer period */
> > +       struct __kernel_old_timespec it_value;       /* timer expiration */
> > +};
> > +
> > +struct __kernel_itimerspec {
> > +       struct __kernel_timespec it_interval;    /* timer period */
> > +       struct __kernel_timespec it_value;       /* timer expiration */
> > +};
> >  #endif
> >
> >  enum tst_ts_type {
> > @@ -129,6 +140,14 @@ struct tst_ts {
> >         } ts;
> >  };
> >
> > +struct tst_its {
> > +       enum tst_ts_type type;
> > +       union {
> > +               struct __kernel_itimerspec kern_old_its;
> >
> 
> I guess this line should be used 'struct __kernel_old_itimerspec', right?

Thanks for spotting this.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
