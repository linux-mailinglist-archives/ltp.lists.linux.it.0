Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CA7165853
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 08:19:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 262533C25C7
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 08:19:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 821453C12AE
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 08:19:28 +0100 (CET)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B1DEC1A017B2
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 08:19:27 +0100 (CET)
Received: by mail-pf1-x443.google.com with SMTP id k29so1447367pfp.13
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 23:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=P/8V2vhIWUytPPJumBc3+hR+qyLG/TmXcpWMFdtJn4c=;
 b=zIQlWLNQ8208qWuH7+KnY9i+3Ud9Ec4hhCqZuOwdmyozw+/hvq3+jkTV7vAUHIwT7E
 kfK8YBKsTx7V9xWo6c0FniBbeKIrLKNam6yuOK7IgkACo+Meagg8TbA8Ft2wlNdtRu4Q
 9YbbbkzP3FzKQz/O4EnWofjJt8JR3XOLWYYCrTcOmRb44EySxNmxVWaKv8PUJIvaAa5O
 Wvz7WF2060JXZ2L6AWc72U1fbsfthvRTv+aUKejbWzmueDgfjzIuU2vTc4pTTFqAR4Sq
 EsJXRZSiYk8+Ul8NWYipSRa89OVu/m/557P5UegQ/Pk1uG0RRSZNzFGbWudAyXKS5lje
 UwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=P/8V2vhIWUytPPJumBc3+hR+qyLG/TmXcpWMFdtJn4c=;
 b=a85g8A9GlFE7KIAVRbfXlmP1IEt48UNI82IrxxCp2kSbhees0J9lWcAQS5h1tti8iP
 T2NxIZ1oJ5w0DtaFt1rUNbRlBnGXkxLTnsg5aNwPfwCM2qBpiecbDW4Bmcw3104E0384
 TtwWITYAaXLQytpqA6RXI7ibLnR2ju/5ivQyLsqLCgUlw4RkDd8Z8sTPiAw1janr7BYo
 FxVSIqRm/ejITPUxaL+4JfiKIV1gtYfaEs1oMndbXRkvcRYJ0cR9iBZ8XtCE5QZLKKV7
 OZhpCOsSBySrhcnoSAvN9rhSuwRJdxHcOY3Sqt0TZbu2LVz+IH36LHKxvkmwkljP/gLa
 KBdA==
X-Gm-Message-State: APjAAAVOYu5ITUgNBjvLeuAySqkR9qp+DUHXBoPU1qGYkhYOh10cFoWy
 T5mJa0Dd3ILhPTMtixR2qGNXRw==
X-Google-Smtp-Source: APXvYqwWg6wiVMOfy23XbGxA/XYOscmgf9/EBvBijs8OWzrii+7mTF95GPLYqoXV7QNES9fxrROovQ==
X-Received: by 2002:a65:6405:: with SMTP id a5mr32089343pgv.284.1582183166133; 
 Wed, 19 Feb 2020 23:19:26 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id az9sm2008447pjb.3.2020.02.19.23.19.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Feb 2020 23:19:25 -0800 (PST)
Date: Thu, 20 Feb 2020 12:49:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200220071923.vyr7lpftidkgbi6g@vireshk-i7>
References: <cover.1582104018.git.viresh.kumar@linaro.org>
 <199f58740e42bbdbcba0c847c194f62d2b3bb37b.1582104018.git.viresh.kumar@linaro.org>
 <CAEemH2e9fhUVU3DbpXCEimL0k8eGLuuSRcicq4NYOk_zELLqMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2e9fhUVU3DbpXCEimL0k8eGLuuSRcicq4NYOk_zELLqMw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 01/10] tst_device: Add tst_ismount() helper
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
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 20-02-20, 15:06, Li Wang wrote:
> > +int tst_ismount(const char *path)
> > +{
> > +       char line[256];
> > +       FILE *file;
> > +       int ret = -1;
> 
> +
> > +       file = SAFE_FOPEN(NULL, "/proc/mounts", "r");
> > +
> > +       while (fgets(line, sizeof(line), file)) {
> > +               if (strstr(line, path) != NULL) {
> > +                       ret = 0;
> > +                       break;
> > +               }
> > +       }
> > +
> > +       SAFE_FCLOSE(NULL, file);
> > +
> > +       if (ret) {
> > +               errno = ENOENT;
> > +               tst_resm(TWARN, "No device is mounted at %s", path);
> > +       }
> > +
> > +       return ret;
> >
> 
> Sorry, I think the return value should be '1' if it has been mounted
> already.
> 
> e.g
> These codes will make people confused about whether it's
> mounted successfully or not.
> 
> if (tst_ismount(MNTPOINT))
>         tst_brk(TBROK | TERRNO, "device not mounted");

I kept the return 0 on success thing here as well, but maybe yeah, it
should return 1 on success here.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
