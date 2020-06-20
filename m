Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A67F72022C2
	for <lists+linux-ltp@lfdr.de>; Sat, 20 Jun 2020 11:12:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CCCEC3C2C89
	for <lists+linux-ltp@lfdr.de>; Sat, 20 Jun 2020 11:12:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4D8243C0133
 for <ltp@lists.linux.it>; Sat, 20 Jun 2020 11:12:29 +0200 (CEST)
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B3E4C600C82
 for <ltp@lists.linux.it>; Sat, 20 Jun 2020 11:11:38 +0200 (CEST)
Received: by mail-ed1-x543.google.com with SMTP id m21so9615906eds.13
 for <ltp@lists.linux.it>; Sat, 20 Jun 2020 02:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=x80yDD2DUNpB4p4p7WiofCXY7ep+gisUwVgGjGExHdU=;
 b=KwvJ3ZtCus33aI/GQsDCCQwgierSAm93a0gKTLkBkPNZT57LNJuQWlDD/SmupvkbKg
 Wmd9QRyv491ms+g3QGJexeExUaTpVz+D+loeyCJ29ufUSkIS/gyki1lcEhln8LzIWaw/
 NG5WmwlYCXoZPD1JYTPG2dOwcohN6jUr/qaExogD8kbY/xRmqgmgm4qy/wdbz3x2u8ia
 TtBQv/vqvj9Y2s7u/EFA/vsBBTTMPII1kFFDhJ/BfhpMJXQPRQRXZQhY5vmY1KIxFLui
 ravkh97/IskQMoxzhzNbAycOHWTD7HMpWW+PO9fqy/ftn5weHFg6+EYhO17g/ii/yS3V
 Ah7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=x80yDD2DUNpB4p4p7WiofCXY7ep+gisUwVgGjGExHdU=;
 b=QbxpLaiRw/38a8HnZNwA9yyO7b4cij6lrse+IIktOifuWavciLgpYyEtZoFy7XsUaA
 cL8G/98mSMQa2HCuk8NUWtpcB/OX2kO+m2cyymUVXqsvJXnWcgJXluYjigvVOXwgZNC5
 wydQG2KkLMg52pLn6NfHr0GNtwt4jKEZOnotPennk+K119GhyyXjX+ZPn47VGk9NSkFZ
 oqK71Wt0bhe8oVU2V49Qkde+7lQg7IYNbCEI8p8cvyPs51B/Wgm49VDbZ39Kvw5Y1qnw
 2WzgPJFI6u/q72WQp0TrUpdfvpHKNeKHmEyj2abi5GyIlT5kaJQnGlWK2OEjbRQRfiXh
 OGEQ==
X-Gm-Message-State: AOAM5308K2lmtrzro19X+yOnQcaOTMlRCcSLB7lDuivNYRy3vHWddCxh
 4/TkGvSvx0um8iWS2AxXbzc=
X-Google-Smtp-Source: ABdhPJzVT7vprsRz6dYz1avtGkxpCHgP/VYdz7jwgDu6yXPsu+thxKy/CviZeEPRptqz+nudxp5pJg==
X-Received: by 2002:a05:6402:22ca:: with SMTP id
 dm10mr7181932edb.115.1592644348589; 
 Sat, 20 Jun 2020 02:12:28 -0700 (PDT)
Received: from x230 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id i12sm6648671ejz.122.2020.06.20.02.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 02:12:28 -0700 (PDT)
Date: Sat, 20 Jun 2020 11:12:26 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200620091226.GA281578@x230>
References: <20200619192542.20113-1-pvorel@suse.cz>
 <104572215.16889120.1592632528302.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <104572215.16889120.1592632528302.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] tst_test.sh: Print tst_{res,
 brk} into stdout
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan,

> ----- Original Message -----
> > This allows printing messages on functions which output is redirected
> > into variable or used in eval. Also this change unifies the behavior
> > with C new API, which printed into stderr from the beginning.

> Should the subject say "into stderr"?
Yes. Thanks for pointing out silly error.

> Other than that I'm OK with the change.
Thanks a lot for your review!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
