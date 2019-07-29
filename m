Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5642378D31
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 15:51:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 20C753C1D2E
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 15:51:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id ABCEA3C1D1C
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 15:41:05 +0200 (CEST)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CC08D1000379
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 15:40:58 +0200 (CEST)
Received: by mail-qt1-f195.google.com with SMTP id x22so54742835qtp.12
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 06:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yXQY60O0HoTWVAfqCbGzOZIz9/numviYjONjT1tZ5NQ=;
 b=J0XWo69JwbDyUOO0Bk1BDOiqaiCIgdMBMh79OQE56l1ZgCVUIlw+JIVT096NXvYaz5
 fRggej+7WVJJ8t4x5TxOX/z18pwV5CENkb+QigoW/3amqYGlNkHESr3c6Nl5PZS5srdv
 Ihk6rFVF+E5HnK/6T+LGRoPTSPZUF+EB5p/3h/nVsIiUlP3lYvhORjaWD6MkY/zdU7AM
 JqmgNNP7TDXeP/NTT+z3dbbKzJe4DWQDt3ot+lyJbD4JCssqP5TYTLgCzLIMZt4Y5Y48
 jXhPVCJvQccLZmd9690ruQh4Zfw/aAPazBygUf4ByTnGsFrY/C+xmw7P3+219rYbGwS1
 AuOQ==
X-Gm-Message-State: APjAAAVkPDSZBmAngk7kx/hmHeubihPTTaFs8O3nI0XarAeq6A7ORka4
 444kWru3Avlc0X+LXmSJpDPC5w==
X-Google-Smtp-Source: APXvYqyUSrfro6GO73GJRRL3JZyAbs9RnuaTC0xq5aZHpWwvuZlpI85o1QyfO4J6XZLXU9DbvJx1AA==
X-Received: by 2002:a0c:b627:: with SMTP id f39mr81010392qve.72.1564407663041; 
 Mon, 29 Jul 2019 06:41:03 -0700 (PDT)
Received: from dhcp-12-212-173.gsslab.rdu.redhat.com
 (nat-pool-rdu-t.redhat.com. [66.187.233.202])
 by smtp.gmail.com with ESMTPSA id a23sm25762050qtp.22.2019.07.29.06.41.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 06:41:02 -0700 (PDT)
Message-ID: <ee309a53cd55517886691c36152044a630da391c.camel@redhat.com>
From: Dave Wysochanski <dwysocha@redhat.com>
To: kernel test robot <rong.a.chen@intel.com>
Date: Mon, 29 Jul 2019 09:40:57 -0400
In-Reply-To: <20190729095353.GS22106@shao2-debian>
References: <20190729095353.GS22106@shao2-debian>
X-Mailer: Evolution 3.28.5 (3.28.5-2.el7) 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 29 Jul 2019 15:51:52 +0200
Subject: Re: [LTP] [SUNRPC] 661ccd4df3: ltp.proc01.fail
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
Cc: bfields@fieldses.org, linux-nfs@vger.kernel.org, lkp@01.org, neilb@suse.com,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, 2019-07-29 at 17:53 +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> 
> commit: 661ccd4df38fdcddfeb1f314ac1a1de6c947c3f9 ("[RFC PATCH]
> SUNRPC: Harden the cache 'channel' interface to only allow legitimate
> daemons")
> url: 
> https://github.com/0day-ci/linux/commits/Dave-Wysochanski/SUNRPC-Harden-the-cache-channel-interface-to-only-allow-legitimate-daemons/20190727-042349
> base: git://linux-nfs.org/~bfields/linux.git nfsd-next
> 

This patch is no good and should be NACKd.

Bruce, Neil please consider alternative patch:
[RFC PATCH] SUNRPC: Track writers of the 'channel' file to improve cache_listeners_exist


Thanks.




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
