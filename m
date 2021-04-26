Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DBD36B027
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 11:02:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C65A33C66E8
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 11:02:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EC62E3C2619
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 11:02:05 +0200 (CEST)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 63592600801
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 11:02:05 +0200 (CEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so2671207pjz.0
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 02:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QgUPOmLbG6lMzf6EvAquEZ5cZl+kLAKgoFv+kclRvOQ=;
 b=H8mRtiZIRN47QFo+2+7C3xfz/yVIaPBRS2eCTFMj/l+GJEhzpIjhuB3jhw7HPYD5Jv
 2pa/QV6I+hDAEl0ROl+P8JKU6EV2xaMjwXzOAbaLXm6Kmr49+tpKurYyGx88ql/cLsQF
 R230syJnh0G4Adycbohw5MlmQHRJKqe0y7zTus0GMKrG3Lcup5hROeZ0JF/SMU9WR8v0
 9T10bbT7tk56uBCHp+6d9PH+vd/siXSSUuvGCJpuAO3EHR2J1ASPiwUS1yTLNpU4JQyz
 e6vIzRPsRp5lK7IN1DndIT71V+BI5QQUYdgg9NJvLI6SbP32xWs7DJXfxpCWVIaeGPh/
 gVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QgUPOmLbG6lMzf6EvAquEZ5cZl+kLAKgoFv+kclRvOQ=;
 b=CX80ViRJKWpR1bh2xafeFeeD6ibiPqgtvCKoumk+YmWYe+sgSvf+cX9fCYqK5ui+H7
 50xXEwV+TvvriUSbTiNRNti0wem9R4ZRiK8PLjZzvXrd4xlEhan8bnu28V3zJnBaM4rs
 0o010I8nlVXRcMx/zNFl78w80mxZIXoBUWc+S8rpiLUyigkZBqRNPcYR9D1ZfJRLpPV4
 6JwxUn+T66qDatXRoJw01ERG1r87otAX1u+EnUtphlcw1aV7QrbhcK7sSvryEOCJoF4h
 skQANWKuDj5mZjyyWvz7y47Vuzv6Usj0va3oT6W4vNz63dE81E1Ueg1nfNqh1hDDUqCP
 SlGQ==
X-Gm-Message-State: AOAM532j5Jwuwh1g+GmmpoYRY3ViagswuTEhPfWCL2dLvv2YiTndtg3r
 v2HO8TQpAC3R79ULdzGxKCzjmQ==
X-Google-Smtp-Source: ABdhPJzAOuepKsdavsjMudA9JavfX2C3VmqEGAfl5HUQ10a7+xkvs14ipe7sLEsnAPCML0OOmJbo7Q==
X-Received: by 2002:a17:90a:8b97:: with SMTP id
 z23mr20732034pjn.65.1619427723840; 
 Mon, 26 Apr 2021 02:02:03 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id a7sm10743743pfg.65.2021.04.26.02.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 02:02:03 -0700 (PDT)
Date: Mon, 26 Apr 2021 14:32:01 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <20210426090201.4ypx4hdyskpbufuf@vireshk-i7>
References: <20210426074812.27798-1-sujiaxun@uniontech.com>
 <4b724549-4623-b7c8-72eb-7f7d309274ad@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b724549-4623-b7c8-72eb-7f7d309274ad@uniontech.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fix the 64-bit macro definition of mips
 architecture
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 26-04-21, 17:00, sujiaxun wrote:
> Hi Viresh,
> 
> Please process the patch below.
> 
> 
> > The mips architecture gcc does not have a built-in __arch64__,
> > you can also use "__BITS_PER_LONG == 64"
> > 
> > Signed-off-by: sujiaxun <sujiaxun@uniontech.com>
> > ---
> >   include/lapi/msgbuf.h | 2 +-
> >   include/lapi/sembuf.h | 2 +-
> >   include/lapi/shmbuf.h | 2 +-
> >   3 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/lapi/msgbuf.h b/include/lapi/msgbuf.h
> > index f3277270d..873902e95 100644
> > --- a/include/lapi/msgbuf.h
> > +++ b/include/lapi/msgbuf.h
> > @@ -17,7 +17,7 @@
> >   #if defined(__mips__)
> >   #define HAVE_MSQID64_DS
> > 
> > -#if defined(__arch64__)
> > +#if __BITS_PER_LONG == 64
> >   /*
> >    * The msqid64_ds structure for the MIPS architecture.
> >    * Note extra padding because this structure is passed back and forth
> > diff --git a/include/lapi/sembuf.h b/include/lapi/sembuf.h
> > index 4ef0483a0..66579d294 100644
> > --- a/include/lapi/sembuf.h
> > +++ b/include/lapi/sembuf.h
> > @@ -24,7 +24,7 @@
> >    * Pad space is left for 2 miscellaneous 64-bit values on mips64,
> >    * but used for the upper 32 bit of the time values on mips32.
> >    */
> > -#if defined(__arch64__)
> > +#if __BITS_PER_LONG == 64
> >   struct semid64_ds {
> >   	struct ipc64_perm sem_perm;		/* permissions .. see ipc.h */
> >   	long		 sem_otime;		/* last semop time */
> > diff --git a/include/lapi/shmbuf.h b/include/lapi/shmbuf.h
> > index 28ee33620..ad71d9431 100644
> > --- a/include/lapi/shmbuf.h
> > +++ b/include/lapi/shmbuf.h
> > @@ -27,7 +27,7 @@
> >    * data structure when moving to 64-bit time_t.
> >    */
> > 
> > -#if defined(__arch64__)
> > +#if __BITS_PER_LONG == 64
> >   struct shmid64_ds {
> >   	struct ipc64_perm	shm_perm;	/* operation perms */
> >   	size_t			shm_segsz;	/* size of segment (bytes) */

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
