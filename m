Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47938137083
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 16:01:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F0C883C25B2
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 16:01:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 7EE123C252C
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 16:01:13 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 11A7B1001741
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 16:01:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578668471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zpQe47tM8Czn7EapiOkvaREB6CR7jyPT4zATA/+DSfU=;
 b=YzHHBFAUv30mkw8874KICsjv8ocwKvq27C+/maeicwljxotEYeemMyv0xyrtSdJs1UGN3j
 yT90o1fXKqy6lM+Sz0cyZVQbyes3KSRoN1HYvRzJNuY8aIPgRgWPKYU+h5Yafkdbn0cJug
 OdKT28tiTFr5B1krnw176LmlhlfZql4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-dzKdjjAVN5OukabMST8bLw-1; Fri, 10 Jan 2020 10:01:06 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A53731858F1C;
 Fri, 10 Jan 2020 15:01:05 +0000 (UTC)
Received: from madhat.boston.devel.redhat.com (ovpn-117-237.phx2.redhat.com
 [10.3.117.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F304B1001B00;
 Fri, 10 Jan 2020 15:01:04 +0000 (UTC)
To: Petr Vorel <pvorel@suse.cz>
References: <20191230201122.9749-1-petr.vorel@gmail.com>
 <e01fdaab-617b-dfc3-021c-ea04d0ab42cf@RedHat.com>
 <20200109075835.GB12486@dell5510>
From: Steve Dickson <SteveD@RedHat.com>
Message-ID: <6eaebd7c-90bb-07ea-62f0-38cae6a34e42@RedHat.com>
Date: Fri, 10 Jan 2020 10:01:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200109075835.GB12486@dell5510>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: dzKdjjAVN5OukabMST8bLw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] rpc-tirpc: Remove authdes related tests
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
Cc: libtirpc-devel@lists.sourceforge.net, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



On 1/9/20 2:58 AM, Petr Vorel wrote:
> Hi Steve,
> 
> ...
>>> or is it safe to expect that authdes is compiled out when authdes_create() returning NULL?
>> This was the way the glibc people suggested I do it... 
> Thanks for info (deprecating features in library is new thing to me).
> 
>>> I also decided to remove tests because authdes is deprecated and uClibc
>>> and musl does not provide DES authentication.
> 
>>> FYI I've sent patch to libtirpc to add authdes_seccreate() interface [1].
>>> [1] https://sourceforge.net/p/libtirpc/mailman/message/36889142/
>> This is fixed in tag libtirpc-1-2-6-rc1 which I just pushed upstream.
> Thanks!
> 
>> Is there anything else from my side that is needed?
> Hope distros will backport the fix soon.
> 
> Can you please either ack this patch or request we detect authdes support
> support (i.e. libtirpc < 1.2.5) and keep tests in this case?
The ack is done! :-)

steved.

> (I'd be for removing these tests, but if you consider them useful for testing,
> I'll do the detection).
> 
> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
