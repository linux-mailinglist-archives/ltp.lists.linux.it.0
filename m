Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EC96D1F15F9
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 11:58:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 329743C2E96
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 11:58:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id E06693C2068
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 11:57:58 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 18BE6200DFF
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 11:57:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591610276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fQLaF/yl/uBhQidTra0B7MaA+TaluiJXE1zc2/G8cSM=;
 b=VU7C5T+soVPyuX0SotnJM8AA6LRGiZy6EOcLiczzgYtolarVmM3XSYldXuGR5WnHJhQylU
 PUCMiriIv5GSWlg87H2MyDZ4vtCcefwTnmXEJ2jDFebWbdbT+j8P97zHiaWWg/9TxCw0s/
 oNJjwcB2+BbDmQahrfxZMaB+EMMsJEs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-8poZLoIoNqyOgA2R3X8Q3g-1; Mon, 08 Jun 2020 05:57:53 -0400
X-MC-Unique: 8poZLoIoNqyOgA2R3X8Q3g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CB7A800053;
 Mon,  8 Jun 2020 09:57:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64F397BA1A;
 Mon,  8 Jun 2020 09:57:52 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D1C114CCF;
 Mon,  8 Jun 2020 09:57:52 +0000 (UTC)
Date: Mon, 8 Jun 2020 05:57:52 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Kushal Chand <kushalchand@zilogic.com>
Message-ID: <472905204.15124870.1591610272008.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200608092635.15248-1-kushalchand@zilogic.com>
References: <20200608092635.15248-1-kushalchand@zilogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.5]
Thread-Topic: Added test case to test mmap with MAP_FIXED_NOREPLACE flag
Thread-Index: iTWsA1vHiR1dXkrMSIh0ybc6wexgSQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Added test case to test mmap with
 MAP_FIXED_NOREPLACE flag
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
Cc: ltp@lists.linux.it, "Vijay Kumar B ." <vijaykumar@zilogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> 
> This patch adds a new test case for the mmap syscall. It tests the
> MAP_FIXED_NOREPLACE flag of mmap. The code checks if MAP_FIXED_NOREPLACE
> returns with EEXIST when mapped with an already mapped address. It does
> so by allocating an available address by passing NULL to first argument
> of mmap and tries to mmap with MAP_FIXED_NOREPLACE flag at the same
> address returned by the first mmap call. This fails as expected. It also
> does the necessary changes required to run the syscall using the runltp
> command after building the LTP test suite.
> Git Hub Issue link - https://github.com/linux-test-project/ltp/issues/299
> 
> Signed-off-by: Kushal Chand <kushalchand@zilogic.com>
> Reviewed-by: Vijay Kumar B. <vijaykumar@zilogic.com>
> 

Hi,

> +static void test_mmap(void)
> +{
> +	int str_len;
> +	void *address;
> +
> +	str_len = strlen(str);
> +
> +	SAFE_WRITE(1, fd_file1, str, str_len);
> +	mapped_address = SAFE_MMAP(NULL, str_len, PROT_WRITE,
> +				   MAP_PRIVATE, fd_file1, 0);
> +
> +	SAFE_WRITE(1, fd_file2, str, str_len);
> +
> +	address = mmap(mapped_address, str_len, PROT_WRITE,
> +		  MAP_PRIVATE | MAP_FIXED_NOREPLACE, fd_file2, 0);

This needs fallback definition in lapi/mmap.h, otherwise it won't compile
on older distros.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
