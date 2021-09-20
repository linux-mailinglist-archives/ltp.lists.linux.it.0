Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 811D1410F8C
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 08:40:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C8CD3C8631
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 08:40:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8EBD93C19F3
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 08:40:56 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5ABCA1A00E18
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 08:40:56 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id AA03F9F917;
 Mon, 20 Sep 2021 06:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1632120054; bh=7iPayDKhalyjHEFs7jz3gyyDOHU1pjMM//NDb4EeClo=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=K7VWJCJTHi98Z+XQQbLEgXyuQUl0g9hsGNV/UMdyE185Si9WzYrKpT/mn9VOTX+Jv
 uftutHxFWwR+sBzax9jVyhuSLL0eRWHUYI1VPTkCeqDhsiJPV6q8YSsxBXsngI2Q8/
 8TXrQU9+GnMLLUAc5qDD+97lW4T/oK3uHd0goZCk=
To: ltp@lists.linux.it, Petr Vorel <pvorel@suse.cz>,
 Cyril Hrubis <chrubis@suse.cz>
References: <YTim11sKKT8ioZBe@yuki> <YUCPJlim3QFcoibU@yuki>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <f8854610-bf63-be57-bdb8-e4e16345e34a@jv-coder.de>
Date: Mon, 20 Sep 2021 08:41:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YUCPJlim3QFcoibU@yuki>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] LTP release planning
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

Hi Cyril and Petr,


On 9/14/2021 2:01 PM, Cyril Hrubis wrote:
> Hi!
>> And lastly but not least if you have some patches that should be
>> included in the release please make me know ASAP so that we have a
>> chance of getting them in.
> Gentle reminder, if there is anything that haven't been reviewed yet and
> should be part of the release let me know ASAP.
What about this patch?
https://lists.linux.it/pipermail/ltp/2021-September/024831.html

Late reply, because of my vacation for the last two weeks.


Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
