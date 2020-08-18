Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 779CE248679
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 15:55:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 233AA3C5883
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 15:55:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 4E8E03C0639
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 15:54:57 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 6CC351400741
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 15:54:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597758894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BG6TqCucYD8D5IjsHV49Vv3rgiZBS/wq0HZadJzp+MM=;
 b=HFXHK7NYCFYxPhPCwkg8PP9YHOreddAII3ud4bgBQKKS5BkFtkBN20PVMl9lcp81o5HUqz
 aTfcz9XANxtRZT5H59tDLCKus7nF6uz+cdPGA3pkiXTIhwZeuPVFc4GU0puj9vZaRhZCJz
 85V/yz+rKdNGf6Y5WAcssyPTqGqqZPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-5FnGckWsNUGCzw1Q_6frYw-1; Tue, 18 Aug 2020 09:54:38 -0400
X-MC-Unique: 5FnGckWsNUGCzw1Q_6frYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C66E81F021;
 Tue, 18 Aug 2020 13:54:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6523C5C1DC;
 Tue, 18 Aug 2020 13:54:37 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 62F2E4EE16;
 Tue, 18 Aug 2020 13:54:36 +0000 (UTC)
Date: Tue, 18 Aug 2020 09:54:36 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <1124120972.9071386.1597758876284.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200811130502.12010-1-mdoucha@suse.cz>
References: <20200811130502.12010-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.15]
Thread-Topic: Integrate tst_taint_check() into main LTP library
Thread-Index: CDKRRM4I2mCUXg+w3pimdUjM46XCwg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] Integrate tst_taint_check() into main LTP
 library
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
>  static void do_test_setup(void)
> @@ -1279,6 +1282,9 @@ static int fork_testrun(void)
>  	alarm(0);
>  	SAFE_SIGNAL(SIGINT, SIG_DFL);
>  
> +	if (tst_test->taint_check && tst_taint_check())
> +		tst_brk(TBROK, "Kernel is now tainted.");
> +

Shouldn't this be TFAIL?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
