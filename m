Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E609D229BD1
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 17:52:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6869E3C76F9
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 17:52:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id AC00A3C2865
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 17:52:23 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 21845201147
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 17:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595433141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2VwgplO2wK20YPfQyqWl0Xodig+Qh4Nfcbe4faw0u0s=;
 b=Bkg2ADhyL+Ojx7vpJApOrvEyCU6Mqv7ktwPUDjtYPt8Qrh7aNVxWd06J7H42HT/JPffqO9
 B8cEOHqgXG9uqTr4O10EoY5yQ/9FmnzZBUvpwQDPIkPZHN6innR4B+TTPZLFsUmPCesi4L
 ruKmh4vO/qwaZkeHiSKbcKlIKBMULM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-YNyhb7eNMTaUnZNOO5Tsyg-1; Wed, 22 Jul 2020 11:52:19 -0400
X-MC-Unique: YNyhb7eNMTaUnZNOO5Tsyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A2D9800C64;
 Wed, 22 Jul 2020 15:52:18 +0000 (UTC)
Received: from centennial.enunes.eu (unknown [10.40.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 114F72DE6F;
 Wed, 22 Jul 2020 15:52:17 +0000 (UTC)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200720194920.22784-1-ernunes@redhat.com>
 <20200721152606.GA13733@yuki.lan>
From: Erico Nunes <ernunes@redhat.com>
Message-ID: <9eba9629-72a3-81e0-03dc-6bb78f19538d@redhat.com>
Date: Wed, 22 Jul 2020 17:52:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721152606.GA13733@yuki.lan>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] lib: add function to check for kernel lockdown
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

On 7/21/20 5:26 PM, Cyril Hrubis wrote:
>> +void tst_lockdown_skip(void)
>> +{
>> +	char line[BUFSIZ];
>> +	FILE *file;
>> +
>> +	if (access("/sys/kernel/security/lockdown", F_OK) != 0)
>> +		return;
>> +
>> +	file = SAFE_FOPEN("/sys/kernel/security/lockdown", "r");
>> +	fgets(line, sizeof(line), file);
> 
> The compiler complains that we haven't checked the return value here I
> guess that we can silence it with:
> 
> 	if (!fgets(line, sizeof(line), file)
> 		return;
> 

Thanks, will fix in v2.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
