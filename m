Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BB83580D8
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 12:37:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1CB273C738C
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 12:37:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EEE7C3C19E4
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 12:37:50 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 498B920038B
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 12:37:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B2B78B007;
 Thu,  8 Apr 2021 10:37:49 +0000 (UTC)
Date: Thu, 8 Apr 2021 12:33:25 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YG7b9c8b9DBpz3QS@yuki>
References: <1616497037-19158-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1616497037-19158-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <46e7a46a-f3d2-078d-1126-5a8679cea7be@oracle.com>
 <606E7268.8000603@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <606E7268.8000603@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] syscalls/semctl01: Convert into new api
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Does it really require root?
> See ftok(3) manpage, it said "The  ftok()  function uses the identity of 
> the file named by the given pathname (which must refer to an existing, 
> accessible file)".
> ftok source code
> key_t
> ftok (const char *pathname, int proj_id)
> {
>    struct stat64 st;
>    key_t key;
> 
>    if (__stat64 (pathname, &st) < 0)
>      return (key_t) -1;
> 
>    key = ((st.st_ino & 0xffff) | ((st.st_dev & 0xff) << 16)
>           | ((proj_id & 0xff) << 24));
> 
>    return key;
> }
> 
> To ensure ftok succeed, we must require root. Or, modify GETIPCKEY api, 
> we can use tmp directory. Anyhow, I will send a v2 to remove useless 
> funtion declartion firstly.

Unless we are sharing the semaphore with a process that wasn't worked
from the test process we can also pass IPC_PRIVATE instead of the key.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
