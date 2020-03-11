Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C47061811CE
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 08:22:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2BE563C5F50
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 08:22:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D002E3C0889
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 08:22:17 +0100 (CET)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B1ADB60084C
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 08:22:16 +0100 (CET)
Received: by mail-pg1-x543.google.com with SMTP id t3so699189pgn.1
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 00:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DP/AtM4VE/8EmCjeF7PzZN0105wfU2WBsm4534+J1Cg=;
 b=OQPyWeReQ1J0iEc3gXi3yWyOGfJkUPXKCNwARi0qzYOMK102DEsgzJJghiIeGljUF3
 FtMfVSlFFr9rgCWijaPx4vsqG+sMdNPI9bogRHoDb7jXgAqaVeUF4RL+BvJ+SjnmbC7w
 mCsCXCETC/5iePxGTsbWwi4urvWI7NOT88zgcdHB8ddE1K6EcRW2TINb4ERabjIgxdb2
 7qNDlJHpDX5a45/uvyVGhVvuoD883i8Tk8O1AP8I7niTVKhMlcpeWKQNLMIQwdP1yH1o
 iMISNDrv6IQnSoK+AiceEV/tg+Wecf/5YjQvrarUJeVTnaPOiWwxz8vAtxlW8LmvglG2
 wjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DP/AtM4VE/8EmCjeF7PzZN0105wfU2WBsm4534+J1Cg=;
 b=jqdBr83QIftvrBmiAVj8a7y+WBYgxwbFqO7z2PLc59lWsBAr1Wx2GJdJtNl8rCJdXJ
 viEhQZFvX+qfgOz7qnAjyXWStF70WtQM+d5wspIKoJYbBmFEOC0wOXE30JNkwqSMoi9P
 rt09ckp22ow0VrT0xqdpczgfTcxWhijWfD6V9prO8YLqyXClY23bRkjhBclEIEWG/S4+
 mfxhZ9vI0189Mq5UeDBmySqcmOrhW6lSs2dzR0xuzjiYhSyaFR1q+4fWeWZk77Kb+vZ3
 +udIPuE9khwPS3VJyjyutZEXSz6fH7cvYXMp0/XPGAeIsNXvBGHTKDXp2otS9MS6oRRN
 slBQ==
X-Gm-Message-State: ANhLgQ0jhst13ML9EM4/a9CHHXCbnXlGsQ+td2WC8k35/bSHB9BVhaAp
 8l0XwY3wkbJvBJJMIEwWCqJpxw==
X-Google-Smtp-Source: ADFU+vuSCRGDivkv+ifyvBlB72poP+8Oyo6mFFvWjoKY/wi9aH7vuP6nDzUQEqEULb2fawYOT6FNzg==
X-Received: by 2002:a62:6490:: with SMTP id y138mr1567857pfb.96.1583911335221; 
 Wed, 11 Mar 2020 00:22:15 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id y9sm13861318pgo.80.2020.03.11.00.22.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Mar 2020 00:22:14 -0700 (PDT)
Date: Wed, 11 Mar 2020 12:52:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200311072212.hsi2euwmvwrxuenw@vireshk-i7>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
 <21026a48ffa25ed8b09616cb939dc417459d2d74.1582779464.git.viresh.kumar@linaro.org>
 <20200306124749.GB3375@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200306124749.GB3375@rei.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V5 02/10] lapi/fsmount.h: Add
 fsopen_supported_by_kernel()
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 06-03-20, 13:47, Cyril Hrubis wrote:
> On Thu, Feb 27, 2020 at 10:44:30AM +0530, Viresh Kumar wrote:
> > Add a helper to check if the fsmount() related syscalls are supported by
> > the kernel or not.
> > 
> > Reviewed-by: Petr Vorel <pvorel@suse.cz>
> > Acked-by: Li Wang <liwang@redhat.com>
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  include/lapi/fsmount.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/include/lapi/fsmount.h b/include/lapi/fsmount.h
> > index 87f2f229c371..a6a24904e66d 100644
> > --- a/include/lapi/fsmount.h
> > +++ b/include/lapi/fsmount.h
> > @@ -130,5 +130,14 @@ enum fsconfig_command {
> >  
> >  #endif /* OPEN_TREE_CLONE */
> >  
> > +void fsopen_supported_by_kernel(void)
> > +{
> > +	if ((tst_kvercmp(5, 2, 0)) < 0) {
> > +		/* Check if the syscall is backported on an older kernel */
> > +		TEST(syscall(__NR_fsopen, NULL, 0));
> > +		if (TST_RET == -1 && TST_ERR == ENOSYS)
> > +			tst_brk(TCONF, "Test not supported on kernel version < v5.2");
> 
> 		Shouldn't we close the TST_RET here?

I didn't do that in the else part as this call should never succeed
and it will be a bug if it succeeds. Do you still want me to do it ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
