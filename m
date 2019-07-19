Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C966E06C
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 07:03:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 212DF3C1D15
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 07:03:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B0B793C1D02
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 07:03:00 +0200 (CEST)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B29E560215F
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 07:02:59 +0200 (CEST)
Received: by mail-vs1-f66.google.com with SMTP id k9so20732467vso.5
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 22:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kNlQkIw5IA67vI2yRD32ksrdV0KG4ZcrlZo07G2G2uY=;
 b=uac67E0Xrez3HfEVAbyf6kDtIxoaN3gBPJjM1ZMSSomsekoRLkLMmg/Gj0G5s64DBY
 uYJUSQp6qO5dY8GU3yGZ+5t4Am3uidrs+6hbHtX1MBbm75vQmcCwJzYetRW//Ju3uDlX
 YY7IX5V1u1fAZxQylRbI8kOqHGl2E/koTjfQFKAf0PRjXq+P0bv4QhjEnZUbSvj1smbE
 RxLqg1igUlJzM2yADxKykU90dmNoT91R6q2A+YdgcaNDXzZor6Ylvuy6AkwV8ZKW5jlP
 P2J7UakiIwChQqusmJ6YkKiYE725ACmIkbZggHq8LqmnQT8BUbLmOMaDlSeEhBijUsJa
 cZeQ==
X-Gm-Message-State: APjAAAVVghFbC1yuipEAoJFu22F6ZLvQiUHfX8O85B5IvpbbvDMq7X2b
 5nJ6S98GR371XS+eOGFSC1axdA5Vz6/cLvyS+FWQE1xE
X-Google-Smtp-Source: APXvYqzYcqHQXRpd4bVleSPsRsO7OldHWaua1LV+Sg/VM9x6LqHxo/24YlI5fVJYL0evABA6rj9YliD4llEXprx2avQ=
X-Received: by 2002:a67:ed87:: with SMTP id d7mr9281863vsp.130.1563512578636; 
 Thu, 18 Jul 2019 22:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190718083943.7687-1-pvorel@suse.cz>
 <20190718083943.7687-2-pvorel@suse.cz>
In-Reply-To: <20190718083943.7687-2-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 19 Jul 2019 13:02:47 +0800
Message-ID: <CAEemH2e6PmPYWWQg+NgSR=6Qc4BZpEswbcc4Y+n3B_pFqnQJDQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] c: Use $LTP_TIMEOUT_MUL also in retry
 functions
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Jul 18, 2019 at 4:40 PM Petr Vorel <pvorel@suse.cz> wrote:
>...
>  #ifndef TST_COMMON_H__
> @@ -51,15 +40,22 @@
>
>  #define TST_RETRY_FN_EXP_BACKOFF(FUNC, ERET, MAX_DELAY)        \
>  ({     int tst_delay_ = 1;                                             \
> +       float m = 1;    \
> +       char *mul = getenv("LTP_TIMEOUT_MUL");  \

We also need a prefix/suffix in the variable definition to make sure
that it will
not alias with anything that has been passed to the FUNC, just like what we do
for the tst_delay_.

e.g. if the FUNC is defined as foo_func(m); the m variable will be aliased and
the function will do something very unexpected.

> +       if (mul) {      \
> +               m = atof(mul); \
> +               if (m < 1) \
> +                       tst_brk(TBROK, "Invalid timeout multiplier '%s'", mul); \

If we reverse some code order in tst_set_timeout() function, then here
we have no need to check if m < 1 again, since the LTP_TIMEOUT_MUL
valid check will be finished in setup() early phase.
(This comment is just FYI, and I also think it's OK to check twice.)

--------------------------------------
void tst_set_timeout(int timeout)
{
        float m = 1;
        char *mul = getenv("LTP_TIMEOUT_MUL");

        if (mul) {
                m = atof(mul);
                if (m < 1)
                        tst_brk(TBROK, "Invalid timeout multiplier '%s'", mul);
        }

        if (timeout == -1) {
                tst_res(TINFO, "Timeout per run is disabled");
                return;
        }

        results->timeout = timeout * m + 0.5;

        tst_res(TINFO, "Timeout per run is %uh %02um %02us",
                results->timeout/3600, (results->timeout%3600)/60,
                results->timeout % 60);

        if (getpid() == lib_pid)
                alarm(results->timeout);
        else
                heartbeat();
}


--
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
