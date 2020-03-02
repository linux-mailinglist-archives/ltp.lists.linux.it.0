Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F79175695
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 10:07:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1F903C682A
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 10:07:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 0548C3C67FB
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 10:07:23 +0100 (CET)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F02A6600C3D
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 10:07:22 +0100 (CET)
Received: by mail-pj1-x1043.google.com with SMTP id cx7so981983pjb.3
 for <ltp@lists.linux.it>; Mon, 02 Mar 2020 01:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=36UW/hKgPCDO4wdD4NhHp8LM+tTPW2pEuG88N2oIHcc=;
 b=hhM2AO7NmPSsgsjDcKOrmB9tfYuVqlf0i3jF45UEjqV5lf/P7+8F01kYSfuR1sOOA1
 0s3cHfUm9OntaY32vArhdF2dkBAtZIInQLLldz3Kxk5KXPfbcRr5MR4O4I7f5f0SadKz
 V1WktTnAduO+tpkjblDxXkeszNB8m76D/1MAzGRR1wExZbXlFEvcbC5+7Vef7K3EVbqO
 iACoC9xZR/FtFxYc/cm8zmHMq7jqdHmUwrdNnaowMhkxbfxmjWLgYncz9UmYqtgAPgow
 vv+WHDLpOi3d5ss+7VOWx47jfLQPx2u57dceq+L00YMT+h22x0kbklXuFrAzhEfZU8sG
 AD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=36UW/hKgPCDO4wdD4NhHp8LM+tTPW2pEuG88N2oIHcc=;
 b=PPcivfal+1T1al8eEx8SYVB9xUzOeHIBeCJlPn5GZt6ESbVCQBgvDRFWmbJZTfVnjJ
 6Pd+C/z9OH9JT5Y3FatZFIUDBUxdBG7d/QbNj5Lo9kIZdvWQLK1AuE+1x8mOER9RenzA
 yav+PNyMjft2Qnh8kFPUs5azxirb3tAlK5i/IXiZne7bsL7z/RLmnPIWmrmanTlDqsWx
 lPXha9MPfJ3z/wD+0JpOPShhoaXYRrNR60tkyc5wv5c7uv2DNovfUo2g7pKtGOhimp8/
 7rEgpikYmKhsQiMY+EaSmjlT96311W4/bsKvUNPbZNF7n/hxYIw2Liz/5L5DwiKNYN5s
 rdKA==
X-Gm-Message-State: APjAAAU4JhKOSALSnrdNK8WQHVEScrDQB/nGVoKbD9f1JPm60eEAXnoh
 pqlphlwostpWrEL5D8I4S9hipA==
X-Google-Smtp-Source: APXvYqz9jyB49H+SiJoqFlSW9aXurIP+/E5bKg8oL/4/jvYrLDn3QoStFR8DUtnJ1o4nl3kdzb3Tbg==
X-Received: by 2002:a17:902:9886:: with SMTP id
 s6mr17414435plp.100.1583140041455; 
 Mon, 02 Mar 2020 01:07:21 -0800 (PST)
Received: from localhost ([122.167.24.230])
 by smtp.gmail.com with ESMTPSA id v29sm19920295pgc.72.2020.03.02.01.07.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Mar 2020 01:07:20 -0800 (PST)
Date: Mon, 2 Mar 2020 14:37:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200302090718.hmyxgbmrwltxiz56@vireshk-i7>
References: <b927e5f2cd36ec2dd57202b492563922b1a94e77.1582886993.git.viresh.kumar@linaro.org>
 <20200228132210.GC8324@rei>
 <20200302063714.claovt5uyi7gxf2o@vireshk-i7>
 <20200302084651.GA4736@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302084651.GA4736@rei.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/openat2: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 02-03-20, 09:46, Cyril Hrubis wrote:
> Hmm, I guess that it makes sense to add the pointer to how to the tcase
> structure and allocate exact size for the E2BIG case. That should work
> fine, right?

We need to hack it a bit more to initialize rest of the memory as
well. This is what I did before I dropped the idea.

+static void setup(void)
+{
+       uint *temp;
+
+       openat2_supported_by_kernel();
+
+       temp = (uint *)(how + 1);
+       *temp = 0xDEAD;
+}
+
 static void run(unsigned int n)
 {
        struct tcase *tc = &tcases[n];
@@ -60,10 +70,10 @@ static void run(unsigned int n)
 static struct tst_test test = {
        .tcnt = ARRAY_SIZE(tcases),
        .test = run,
-       .setup = openat2_supported_by_kernel,
+       .setup = setup,
        .needs_tmpdir = 1,
        .bufs = (struct tst_buffers []) {
-               {&how, .size = sizeof(*how)},
+               {&how, .size = 2 * sizeof(*how)},
                {},
        }
 };

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
