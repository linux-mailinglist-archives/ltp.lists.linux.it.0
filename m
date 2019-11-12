Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5DEF860F
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 02:27:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99AB53C1840
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 02:27:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 1A44B3C0EAF
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 02:27:04 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3521C1401B18
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 02:27:04 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAC1JP6v192241;
 Tue, 12 Nov 2019 01:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=d0CIgE6VLDN1RdkD6BFHTIX2iR/MvwCtQwIJyh0r6ew=;
 b=PRH6mn6sdO8AC5G+CRAbO66J4Xs6LTMyrOafcYKY4crw65aCjlZH5B2banUCQbGVdfxF
 HyAx3Wv7XuFLMZurpskQT3koewW9AkfKY9p1KPlBQK8CEjD9eBaMzGHKbKhDYL6VBwYy
 ibIfqbvkz7v5s4D7lu74h19viirCXarOui2l8IppRaJqOavZ/86uP6MR35DkJEsASu3g
 YGmv004JLWeihhYrcAKWRVFrA0J/YSN3+iXQ5TXvYbtLuElWPTGKm+LQEmCJ4uy+qZMN
 qHNCuU3XJa0yBca0ah3Gv8AfYZzLW7v7ftQ3fmlpH2UHY6TngS/BY7vv0Sfsak2cIsCs MA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2w5ndq1kfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Nov 2019 01:26:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAC1INd7113586;
 Tue, 12 Nov 2019 01:24:33 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2w66wmxxmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Nov 2019 01:24:32 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAC1OLRj011934;
 Tue, 12 Nov 2019 01:24:21 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 12 Nov 2019 01:24:21 +0000
Date: Mon, 11 Nov 2019 17:24:19 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191112012419.GE6211@magnolia>
References: <20191111083815.GA29540@infradead.org>
 <b757ff64ddf68519fc3d55b66fcd8a1d4b436395.1573467154.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b757ff64ddf68519fc3d55b66fcd8a1d4b436395.1573467154.git.jstancek@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9438
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911120009
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9438
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911120009
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] iomap: fix return value of iomap_dio_bio_actor on
 32bit systems
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
Cc: tytso@mit.edu, arnd@arndb.de, linux-kernel@vger.kernel.org,
 lkft-triage@lists.linaro.org, hch@infradead.org, linux-next@vger.kernel.org,
 broonie@kernel.org, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Nov 11, 2019 at 11:28:10AM +0100, Jan Stancek wrote:
> Naresh reported LTP diotest4 failing for 32bit x86 and arm -next
> kernels on ext4. Same problem exists in 5.4-rc7 on xfs.
> 
> The failure comes down to:
>   openat(AT_FDCWD, "testdata-4.5918", O_RDWR|O_DIRECT) = 4
>   mmap2(NULL, 4096, PROT_READ, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7f7b000
>   read(4, 0xb7f7b000, 4096)              = 0 // expects -EFAULT
> 
> Problem is conversion at iomap_dio_bio_actor() return. Ternary
> operator has a return type and an attempt is made to convert each
> of operands to the type of the other. In this case "ret" (int)
> is converted to type of "copied" (unsigned long). Both have size
> of 4 bytes:
>     size_t copied = 0;
>     int ret = -14;
>     long long actor_ret = copied ? copied : ret;
> 
>     On x86_64: actor_ret == -14;
>     On x86   : actor_ret == 4294967282
> 
> Replace ternary operator with 2 return statements to avoid this
> unwanted conversion.
> 
> Fixes: 4721a6010990 ("iomap: dio data corruption and spurious errors when pipes fill")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>

Thansk for the full explanation & patch, will test...

Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> ---
>  fs/iomap/direct-io.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index 1fc28c2da279..7c58f51d7da7 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -318,7 +318,9 @@ static void iomap_dio_bio_end_io(struct bio *bio)
>  		if (pad)
>  			iomap_dio_zero(dio, iomap, pos, fs_block_size - pad);
>  	}
> -	return copied ? copied : ret;
> +	if (copied)
> +		return copied;
> +	return ret;
>  }
>  
>  static loff_t
> -- 
> 1.8.3.1
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
