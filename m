Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A6413EA3C5
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Oct 2019 20:05:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D1563C1CAD
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Oct 2019 20:05:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 47DA43C04F9
 for <ltp@lists.linux.it>; Wed, 30 Oct 2019 20:05:32 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 2645B1000485
 for <ltp@lists.linux.it>; Wed, 30 Oct 2019 20:05:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572462328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TAwXOYOwl50YVSUTkK8nHzOF6EaLzPzGmYpuZhajoGg=;
 b=YguPyZyacHMOTXlQC9XY1x/761Yq6Yi2fm7ph1nYkuvz6CWYafzNskex4d4AWfJ+wkoeAo
 gue6qu85ksZQtwF15jSMjkQkXct4Jf1CzuLoB1v+9hxzGU+vN8AXr0c8dPFv9+4OA27UTu
 RPVXWKI7ac2y9LD8CZ1fBhSjZlGzCw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-VTwSAc6kMRqJThcA22McjA-1; Wed, 30 Oct 2019 15:05:25 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D4421005500
 for <ltp@lists.linux.it>; Wed, 30 Oct 2019 19:05:24 +0000 (UTC)
Received: from localhost.localdomain (ovpn-121-15.rdu2.redhat.com
 [10.10.121.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4458C5C1B0;
 Wed, 30 Oct 2019 19:05:20 +0000 (UTC)
From: Rachel Sibley <rasibley@redhat.com>
To: ltp@lists.linux.it
Message-ID: <f0844da9-2ed8-ee52-121d-ab97df7aff81@redhat.com>
Date: Wed, 30 Oct 2019 15:05:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: VTwSAc6kMRqJThcA22McjA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] Send CKI test reports to LTP list ?
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

Hello,

As part of the CKI project [1] we are responsible for testing upstream 
kernels, you may have been cc'd
on some of our reports in the past :-)

We test from a recent commit from ltp versus using the latest stable 
version to be able to pull in recent
fixes and new cases as needed. We update about once a month, and test 
out changes before merging.

We were hoping we could start cc'ing the LTP ML on failures going 
forward to help troubleshoot and
review new failures as we find them in CKI. This would also help promote 
better collaboration between
CKI and LTP upstream community. Curious to know your thoughts on this 
and if your ok with this approach?

Thanks!
Rachel

[1] https://cki-project.org/


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
