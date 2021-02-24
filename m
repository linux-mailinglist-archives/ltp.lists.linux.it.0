Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 860FA323F17
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 15:09:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2BC4B3C5A09
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 15:09:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id F03EE3C1C4C
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 15:09:46 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1600A1401169
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 15:09:45 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.1.224])
 by mail.jv-coder.de (Postfix) with ESMTPSA id E1DE3A16B4;
 Wed, 24 Feb 2021 14:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1614175784; bh=dtP/B3x5mGl2Ls8fw58C7qFCvJ47vzcz6Tf/YSktTi8=;
 h=Subject:From:To:Message-ID:Date:MIME-Version;
 b=STfIiu86N8khaIcyckl0r0iTbyXjsfU9ClUbXSfxL+bhWWlRTudxr9wXXAivFReC6
 7AVCgUB6XnCz7Q8dHR/mGT1Nv0Ujjz8iyZnxeI054XUV6j6vv87abgs9cpBqsueDhn
 u0cu7TpsvTnE97cGhiE9+gKYIQAHGVyXHm/kvPxI=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it, Petr Vorel <pvorel@suse.cz>
References: <20210216123841.3424969-1-lkml@jv-coder.de>
Message-ID: <deefa607-a79f-ce97-46a2-8957bbc7e958@jv-coder.de>
Date: Wed, 24 Feb 2021 15:10:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210216123841.3424969-1-lkml@jv-coder.de>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] memcg/stat_test: Use more memory for tests
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

A friendly ping ;)

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
