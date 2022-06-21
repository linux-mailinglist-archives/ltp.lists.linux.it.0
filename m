Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BB85532DA
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jun 2022 15:04:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5DC333C94B1
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jun 2022 15:04:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D561D3C1BBD
 for <ltp@lists.linux.it>; Tue, 21 Jun 2022 15:04:09 +0200 (CEST)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2BE5A14002D3
 for <ltp@lists.linux.it>; Tue, 21 Jun 2022 15:04:07 +0200 (CEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-12-D7su6iPqNO-F5Tx2uXwdog-1; Tue, 21 Jun 2022 14:04:05 +0100
X-MC-Unique: D7su6iPqNO-F5Tx2uXwdog-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.36; Tue, 21 Jun 2022 14:04:04 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.036; Tue, 21 Jun 2022 14:04:04 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Cyril Hrubis' <chrubis@suse.cz>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH v3] uapi: Make __{u,s}64 match {u,}int64_t in userspace
Thread-Index: AQHYhWa4Wwgq8v8s30aZYtCosiJuGq1Z063Q
Date: Tue, 21 Jun 2022 13:04:04 +0000
Message-ID: <a26ab9bfc27a430bb8a7b6aa2f39d724@AcuMS.aculab.com>
References: <20220621120355.2903-1-chrubis@suse.cz>
In-Reply-To: <20220621120355.2903-1-chrubis@suse.cz>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] uapi: Make __{u, s}64 match {u,
 }int64_t in userspace
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "dhowells@redhat.com" <dhowells@redhat.com>,
 "zack@owlfolio.org" <zack@owlfolio.org>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Cyril Hrubis 
> Sent: 21 June 2022 13:04
> 
> This changes the __u64 and __s64 in userspace on 64bit platforms from
> long long (unsigned) int to just long (unsigned) int in order to match
> the uint64_t and int64_t size in userspace for C code.
> 
> We cannot make the change for C++ since that would be non-backwards
> compatible change and may cause possible regressions and even
> compilation failures, e.g. overloaded function may no longer find a
> correct match.

Isn't is enough just to mention C++ name mangling?

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
