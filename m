Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C86102298
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Nov 2019 12:07:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D11AC3C223B
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Nov 2019 12:07:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 92B483C0E97
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 12:07:33 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 316C214088F6
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 12:07:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574161650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9rAYyUNoA0ZxYHxKyHs91v8HQ6+PUQNJ+lVjRwc1WxA=;
 b=h+Iyjg94aepeluBwGVNXy27DRDj+UXQXz48b5hBUcsocBcxtx6ky9hBloPCgOa30+zwV0P
 W5zOqd6vEXmp3fudcJ0BHLc//PG4SdymSA13w0xXtJEx5I2OtrzJ6bgF0LpfhpDhFc11ZT
 jyL24IHdDnUcJVpmDGPiMH9MKvq2dtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265--xAwXiY6NByfUwiQEstcHA-1; Tue, 19 Nov 2019 06:07:28 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A55EA1005500
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 11:07:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D4951E9
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 11:07:27 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 948AB4BB5B;
 Tue, 19 Nov 2019 11:07:27 +0000 (UTC)
Date: Tue, 19 Nov 2019 06:07:27 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1860355560.12961927.1574161647388.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191119094156.20348-1-liwang@redhat.com>
References: <20191119094156.20348-1-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.103, 10.4.195.21]
Thread-Topic: tst_fill_fs: enhance the filesystem filling routine
Thread-Index: Jf0dh4X92+3zIsdAt25dLLiZ7Eju1Q==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: -xAwXiY6NByfUwiQEstcHA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_fill_fs: enhance the filesystem filling
 routine
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



----- Original Message -----
> -		while (len) {
> +		while (len >= fi.f_bsize) {

Let's say f_bsize is 512, and len is 1023. We hit ENOSPC for 1023,
len for next round is 511. Loop ends, but we never tried write with
f_bsize or smaller value.

I think we should try len < fi.f_bsize at least once.

>  			ret = write(fd, buf, MIN(len, sizeof(buf)));
>  
>  			if (ret < 0) {
> +				if (errno == ENOSPC) {
> +					len /= 2;
> +					continue;
> +				}

The return below (in original code) doesn't appear to be reachable now.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
