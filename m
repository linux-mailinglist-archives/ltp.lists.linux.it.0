Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBBA375770
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 17:35:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7A5F3C73DA
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 17:35:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BEAB53C56C9
 for <ltp@lists.linux.it>; Thu,  6 May 2021 17:35:02 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 50244200926
 for <ltp@lists.linux.it>; Thu,  6 May 2021 17:35:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 91038AC36
 for <ltp@lists.linux.it>; Thu,  6 May 2021 15:35:01 +0000 (UTC)
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
References: <YJOYgZNL7/qp5YCN@yuki>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <5b2dca3e-7b3e-678e-1726-9849c76d766a@suse.cz>
Date: Thu, 6 May 2021 17:35:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YJOYgZNL7/qp5YCN@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] LTP Release
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

On 06. 05. 21 9:19, Cyril Hrubis wrote:
> Hi!
> It's about time for another LTP release. So as usuall let's start with
> the list of patches that should go in before the release.
> 
> First of all I will have to fix the docparser JSON string escape patch,
> I will do so ASAP.
> 
> Also I would like to get the CGroup API rewrite in, since that fixes
> real problems and is, as far as I can tell, ready to go.
> 
> The rtnetlink patchset from Martin is nearly ready as well. I would
> apply it as well if we manage to get to final version soon enough.
> 
> That is all for me, if there is anything else please reply ASAP.

Well, I don't really mind if the rtnetlink patches get delayed until
after the release. But just a reminder that I'm planning to resubmit
patch 6 only after the library changes get merged.

On the other hand, I'd like to get the inotify06 fixes into the next
release.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
