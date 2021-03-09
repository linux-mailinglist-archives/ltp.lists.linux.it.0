Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B032331DC6
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 05:06:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8918B3C6BE8
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 05:06:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 67D4F3C176A
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 05:05:57 +0100 (CET)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D18412005F9
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 05:05:56 +0100 (CET)
Received: by mail-pj1-x102d.google.com with SMTP id
 q2-20020a17090a2e02b02900bee668844dso4260183pjd.3
 for <ltp@lists.linux.it>; Mon, 08 Mar 2021 20:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vBiq633rbZQTMg4MY4Jz93rgzg61QQqu6Lx68pKxq7Y=;
 b=Tqh/E4OilfRV5iW2T+d3OL0Ax9dCV7sCPU+qnaUt1aJ6EOU84Ft5xA28Lf9Vwg36/k
 QldRGl1dCwSdlLmX39gg/6tC5nRLXyoP22PAwrFyaDzMmj6f0gsg2Sisb/JyWo/5Twxk
 4q3fq1YqtiZi78Om0+7MQvFoHCPKGCWA8uRw1yiDD1kNIpz2mS5luHVkwJoEqnWX55CN
 daROna6c3SQhOc5UeLqgu11/WoaqBj5s5vgvz93jF8FedovMzGlFJ/tYXbVGPQt815/f
 Ocsz2w+bwihJKIYNw9foh0T8TN+HVbwPhvADxThlFXz2ZHJWPE0rHNKJHK6pf7ooTPlo
 4qJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vBiq633rbZQTMg4MY4Jz93rgzg61QQqu6Lx68pKxq7Y=;
 b=rsG7zedPiU2dQW3WGHvdGutEkqWybRlGdt+a1i6ZLMyzpFokKoTQC+Qf78Pabmeo75
 Lw6I5TkKHBIO3lN8X2kcZIfzlunoFTjje98Uu5a2c5nEV2MY/0OoPvd/WScTog1Eq8KQ
 sRmduwCKR4xgDi9Lq0i4Z6wf+LBeORSj1NzKcvAwVTSDgePPhyYt1r6Mf+HvLqak+cdq
 YFkcd90/XPLbQjH1KnUVctk47UuEBeekEuGtjBkgKSMfkUG92TYXRtewR9mc6fGZsPFG
 lJzA4yBZVPKi3Gmo2GKDJx76hwQCtzi9se1h8SvvE6c8iP7n5LyBwsntrLeYj+hXeVVO
 LH4w==
X-Gm-Message-State: AOAM531iKn+C5rYDbiwE+HscBiUZ+NWGgPXu61l4BBuPGuFv9qPvz++9
 4Gh9bJZTkVRSsWO3DZ+pHJYXJA==
X-Google-Smtp-Source: ABdhPJx83pmqNAyxc85870rVN5EHCc3cEbgG+QIX+2jW+/jBc6gwYWseMmaSXFF6pqRhaY926kj6cA==
X-Received: by 2002:a17:902:f781:b029:e4:419b:e891 with SMTP id
 q1-20020a170902f781b02900e4419be891mr23312333pln.10.1615262755237; 
 Mon, 08 Mar 2021 20:05:55 -0800 (PST)
Received: from localhost ([122.171.124.15])
 by smtp.gmail.com with ESMTPSA id s22sm11167263pgv.94.2021.03.08.20.05.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Mar 2021 20:05:53 -0800 (PST)
Date: Tue, 9 Mar 2021 09:35:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20210309040551.l72n5zmvvmnw44no@vireshk-i7>
References: <20210308065329.25824-1-liwang@redhat.com>
 <20210308101732.lzkjql3t7aoscruk@vireshk-i7>
 <CAEemH2d45hFqhB-++xgswYoOh4HGFtFZxXCKGhLhDdt9oXFbfA@mail.gmail.com>
 <20210308111447.h3l2a5yep3n4n5qs@vireshk-i7>
 <CAEemH2eKkGokVY2ZBs=U9eqDrDZVB5qKBVUApULrdL65tfnmLQ@mail.gmail.com>
 <20210308114859.tskerybpt6xtyffa@vireshk-i7>
 <CAEemH2cKX4Gh1tO2WL27WrnF7KLFu33rksFf+LWRZz6ZNExAOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cKX4Gh1tO2WL27WrnF7KLFu33rksFf+LWRZz6ZNExAOQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] clock_gettime04: print more info to help debugging
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

On 08-03-21, 20:45, Li Wang wrote:
> Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> ...
> >
> > Option 3: Same as option 2 but different formatting
> >
> > clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC: Difference between
> > successive readings is reasonable for following variants:
> >         - vDSO or syscall with libc spec
> >         - syscall with old kernel spec
> >         - vDSO with old kernel spec
> >         - gettimeofday
> 
> Any other option here ?
> >
> 
> I think no.
> 
> >
> > For the FAIL messages, I think just adding tv->desc is good enough.
> >
> 
> +1, I prefer to go with Option3 + 'tv->desc for FAIL'.
> 
> Would you mind formatting a patch, or I can do that?

Since you started it, I will let you finish it as well :)

Thanks.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
