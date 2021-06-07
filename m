Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 898CF39D6D6
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 10:14:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4F88E3C563A
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 10:14:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2531C3C266C
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 10:14:08 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AC6581400547
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 10:14:07 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EFD651FDA5;
 Mon,  7 Jun 2021 08:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623053646;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uNsCbI6GQ6nRyiYU1CNCH9IeeNEpFyOOYCdGIQ0bDIk=;
 b=MsSVg466fb24OTchWnsGOcizXlo4KrA1sbEPylvir8Ibawf6MUdWOSfn3n6lzvK/RY8abZ
 8i2gw+oHfDCRzOYZ0DX2bU7OvLhb+wq7QAZSzvVTeeEgZaYM9uCQfxXrj+TpstpvI/xUvy
 sd4MipWyIm4+qnDsPQTba08iSkht3iI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623053646;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uNsCbI6GQ6nRyiYU1CNCH9IeeNEpFyOOYCdGIQ0bDIk=;
 b=GjVzwx4u79kr7mLbgZlTpJ1AZHxMIgz2C499hL21V9Te3ur0WyfK8Ie9xAd5dqCZQlKIC/
 aPUoNdRLnAkvT6BA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id B78FE118DD;
 Mon,  7 Jun 2021 08:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623053646;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uNsCbI6GQ6nRyiYU1CNCH9IeeNEpFyOOYCdGIQ0bDIk=;
 b=MsSVg466fb24OTchWnsGOcizXlo4KrA1sbEPylvir8Ibawf6MUdWOSfn3n6lzvK/RY8abZ
 8i2gw+oHfDCRzOYZ0DX2bU7OvLhb+wq7QAZSzvVTeeEgZaYM9uCQfxXrj+TpstpvI/xUvy
 sd4MipWyIm4+qnDsPQTba08iSkht3iI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623053646;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uNsCbI6GQ6nRyiYU1CNCH9IeeNEpFyOOYCdGIQ0bDIk=;
 b=GjVzwx4u79kr7mLbgZlTpJ1AZHxMIgz2C499hL21V9Te3ur0WyfK8Ie9xAd5dqCZQlKIC/
 aPUoNdRLnAkvT6BA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id dbSIK07VvWAsaQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 07 Jun 2021 08:14:06 +0000
Date: Mon, 7 Jun 2021 10:14:05 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YL3VTZeb/8Gemgl7@pevik>
References: <YLeA8KOphpVg3IDP@pevik> <YLi3XqA3hLh7HWqn@yuki>
 <YLjDnXeWib2KSILF@pevik>
 <CAEemH2dTBbHbh5Vf9EQyYMsvHKs3p4sZvoNyR=uCFM0X5siYtQ@mail.gmail.com>
 <YLn3BQHhZIq5vNId@pevik>
 <3F3FDAE9-7190-4046-9438-17D2BE14FCA0@gmail.com>
 <YLpt386rlLDzgfCi@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLpt386rlLDzgfCi@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Reduce LICENCE/COPYING files
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Mike Frysinger <vapier@gentoo.org>, Xiao Yang <yangx.jy@cn.fujitsu.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> Hi!
> > Unless there???s a real need for consolidating the LICENSE files,
> > I???d leave it well enough alone in the source tree and just aggregate
> > all of the licenses as an uber license and distribute it with the
> > binary packages.

> As far as I can tell the cleanup patch removes 22 identical copies of
> GPL v2 sprinkled randomly over the tree and keeps only the top level
> one, while each of the individual files still retains a copyright and a
> seprarate license. As far as I can tell this is harmless.

Patch merged, thanks for your ack!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
