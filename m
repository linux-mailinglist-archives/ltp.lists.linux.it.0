Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A33BBEB1A5
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 14:53:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 37A053C2348
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 14:53:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 12B473C229E
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 14:53:06 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 4C2CB601019
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 14:53:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572529983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YxzgHaFf3oZ7yhNjpAbmC6CIzjTd4s0sN6Z43Mm3Ik4=;
 b=UMRBDeAbM9OOqBp/TpeEa7vORsTKL4lD5uicjmg9qm0VCgeGjBEX7U3GFRJwuHA2uJh6Yw
 7dIbGRuRvWIbFJ2kDsigSGixZI1qBA2LFYA2RqGx8Xy5K/v8Rv97Tf8oq6cE2jw2BZWw4/
 sAogSumLwruQIMpPq/5rcI0XfrQvD8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-i8RcWEfTOhGmuJh-V17Dtw-1; Thu, 31 Oct 2019 09:52:59 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 855341800D55;
 Thu, 31 Oct 2019 13:52:58 +0000 (UTC)
Received: from localhost.localdomain (ovpn-121-15.rdu2.redhat.com
 [10.10.121.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0D345C1BB;
 Thu, 31 Oct 2019 13:52:57 +0000 (UTC)
To: Petr Vorel <pvorel@suse.cz>
References: <f0844da9-2ed8-ee52-121d-ab97df7aff81@redhat.com>
 <20191031131026.GA27945@dell5510>
From: Rachel Sibley <rasibley@redhat.com>
Message-ID: <9a8bed00-e2e3-7fc9-1c94-ad900a8e083c@redhat.com>
Date: Thu, 31 Oct 2019 09:52:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20191031131026.GA27945@dell5510>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: i8RcWEfTOhGmuJh-V17Dtw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] Send CKI test reports to LTP list ?
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Thanks for the feedback everyone ! We will enable this soon.

-Rachel

On 10/31/19 9:10 AM, Petr Vorel wrote:
> Hi Rachel,
>
>> Hello,
>> As part of the CKI project [1] we are responsible for testing upstream
>> kernels, you may have been cc'd
>> on some of our reports in the past :-)
>> We test from a recent commit from ltp versus using the latest stable version
>> to be able to pull in recent
>> fixes and new cases as needed. We update about once a month, and test out
>> changes before merging.
>> We were hoping we could start cc'ing the LTP ML on failures going forward to
>> help troubleshoot and
>> review new failures as we find them in CKI. This would also help promote
>> better collaboration between
>> CKI and LTP upstream community. Curious to know your thoughts on this and if
>> your ok with this approach?
> +1. Thanks!
>
>> Thanks!
>> Rachel
> Kind regards,
> Petr
>
>> [1] https://cki-project.org/


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
