Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFB616213A
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 07:58:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2654F3C257E
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 07:58:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A9B143C0133
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 07:58:30 +0100 (CET)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C24701000ACA
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 07:58:28 +0100 (CET)
Received: by mail-pj1-x1044.google.com with SMTP id d5so592728pjz.5
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 22:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qm6rGVEBDhp6aKoR1fWOk+fa67WyrG6tpxZERVuJVTY=;
 b=nwximPAuLoMO6tYcLepWBlef7izYIzTX+ftSE8HvsQ8XZxAJWgz8aWxR1vhm2KiNpE
 6xbbBNNsdnSnoyC5dP1OpGfpALGAv+MggtEqM4hUrBM4afRQqE9m+lgB81FQH3VP5YTV
 YKFN+ewGc59x3q0+2cFGvUUbTdDp19G/Y/nyPuhtaYTspNWDy3p3TXNyhy/N3FNKxlss
 7/DEtBzmv1Nnwaq5w3FlijRwLEyCJQm3XGqxF09OtCSB9V6eDFwIm5U4eGZvJpxtSBQy
 smAWD0SWEPDpKNX58e4kdi11FdyHksqHqEl33Kn0JUdW/yOaqC0V2D+YAUTwlBIk2tx7
 Ic3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qm6rGVEBDhp6aKoR1fWOk+fa67WyrG6tpxZERVuJVTY=;
 b=n6EjIbWa9yptbMxzQemdtTY39Voas97JbX6ydS+5sDHnsE4OSp57oPqoBPkIvf6j34
 SKcQGljq5l5U2F2by8UPQeiEEvEKtSpltL0v9YM4lisNyVDLiC69xCkbFujbSxiSxYjw
 2hNCGkh9xewVHGI8DODazf2HEZIRxpJagjGv5dlGD+w0WqtY3zvC05N5TMI4wtW0f4gw
 m71A4P+sj+ayrYgqxWUywilRb5XbnniOEc/8CIMfXNrDmd2MFgTRE6MticjoLtAvrsiv
 BZeuGcZDb2Wcc73uG82L8HEI9N3ZfieML/H8VlVCulOJ8UThTJhY+WpO8QqaN/g8dAsy
 JHLw==
X-Gm-Message-State: APjAAAWJhyL6hIty+EFFOdQRkUlM49Jfwn4ggheOMaKsMIPpO3sIJA2/
 +JkFdrg/6NXAMevdDuUmhLjb2km+cFw=
X-Google-Smtp-Source: APXvYqy7kLiKuGwLTiLzyahGRvl3UKfcV9DaIJGPyn4rgD76ypWco1qRErc9upn4Yq8I7XZofqznrg==
X-Received: by 2002:a17:902:169:: with SMTP id
 96mr18927683plb.74.1582009107815; 
 Mon, 17 Feb 2020 22:58:27 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id a17sm1609419pjv.6.2020.02.17.22.58.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Feb 2020 22:58:27 -0800 (PST)
Date: Tue, 18 Feb 2020 12:28:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it, Zorro Lang <zlang@redhat.com>
Message-ID: <20200218065825.wtjjnt66jczsycej@vireshk-i7>
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <20200218061906.GB14282@dhcp-12-102.nay.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218061906.GB14282@dhcp-12-102.nay.redhat.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/7] Add new LTP tests related to fsmount family
 of syscalls
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Zorro,

Thanks for taking time and providing your feedback :)

On 18-02-20, 14:19, Zorro Lang wrote:
> On Fri, Feb 14, 2020 at 05:05:49PM +0530, Viresh Kumar wrote:
> Thanks for all these cases, that's really helpful.
> 
> Although you write cases for each new mount API, each xxxxx01.c case looks
> nearly do same things.

I agree, just that they are all slightly different, and perhaps they can be
improved to test different parameters for the success case as well.

I think all the *02.c files are quite different that way, and perhaps *01.c
tests should do the same.

> That's why I only wrote one case for new-mount currently, due to basic mount
> test already can through most of new APIs(except open_tree and fspick). I don't
> know if we should write nearly same things in different directories.
> Actually I prepared open_tree and fspick test cases(planned to name as newmount02
> and newmount03. but the newmount01 has been changed to fsmount01 :), but didn't
> sent out, due to I hope to the first case(which does basic changes) can be merged
> at first.

Heh. I had no clue that anyone else is working on this stuff else I won't have
touched it at all (and saved some time) :)

> All of your xxxxx02.c cases are great! I planned to test more different
> parameters of fsconfig() later too. Your invalid parameters test are nice.
> As you've sent these cases, I think these should be reviewed at first, avoid
> we do same things:) I'll try to help to review V2 patchset too, if I can:-P

Thanks for suggesting this way out, and I agree 100% with you.

FWIW, I am working on V2 which I should be able to send by tomorrow max (if
everything goes as planned). Lets see how it looks after that and I would love
to review any improvement patches you may have after these are merged (Please cc
me directly, I haven't opted for receiving emails from ltp list).

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
