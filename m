Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F7D9940C
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Aug 2019 14:45:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CEFA3C1D69
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Aug 2019 14:45:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B8AD83C1CF8
 for <ltp@lists.linux.it>; Thu, 22 Aug 2019 14:45:15 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8471F1401824
 for <ltp@lists.linux.it>; Thu, 22 Aug 2019 14:45:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9F440ADBB;
 Thu, 22 Aug 2019 12:45:13 +0000 (UTC)
Date: Thu, 22 Aug 2019 14:45:12 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jim Woo <wsy940401@gmail.com>
Message-ID: <20190822124512.GB6325@rei>
References: <CAJwJstDWVJ8HG=Fe1VZtPDTAsCawfoKkdLAikFMQZ-hXhOprvA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJwJstDWVJ8HG=Fe1VZtPDTAsCawfoKkdLAikFMQZ-hXhOprvA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] (no subject)
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

Hi!
> I want to ask if I can use ltp for stressing CPU and Memory with Linux OS?

What kind of stress do you have in mind?

I guess that for CPU stress something as compiling kernel in a loop with
large enough -j parameter will suffice.

There are some test for OOM and memory overcommit, these are part of the
mm runtest file.

> If the answer is yes, Can I get the detailed explanation about the hierachy
> of ltp because I think the document of ltp did not explain that.

Unforunately that part of LTP is undercommented, you have to mostly
explore on your own, sorry.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
