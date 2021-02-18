Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0958731EAFC
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Feb 2021 15:36:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B388B3C6642
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Feb 2021 15:36:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 63CB83C5501
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 15:36:09 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 77CE3100037E
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 15:36:09 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5445ACE5
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 14:36:08 +0000 (UTC)
Date: Thu, 18 Feb 2021 15:36:07 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
Message-ID: <YC57VyRUUfuTORUt@pevik>
References: <20210215110419.2964-1-pvorel@suse.cz> <YCugPYQxkf61gxiK@pevik>
 <YC4+dlPsqvmYaAks@yuki.lan> <YC5xtPp6kHTR7XDl@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YC5xtPp6kHTR7XDl@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] configure: Improve error message on missing
 pkg-config
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> > > 	[m4_fatal([must install pkg-config or pkgconfig and pkg.m4 macro (usual dependency), see INSTALL for all dependencies])])

> > Maybe just shorten it to "..., see INSTALL"
> Good point, merged with this change.
> Thanks for your review!

It looks it broke Centos 7, looking into it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
