Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FE0177585
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Mar 2020 12:55:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7EF853C66F2
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Mar 2020 12:55:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5CBBF3C66E4
 for <ltp@lists.linux.it>; Tue,  3 Mar 2020 12:55:03 +0100 (CET)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4D1796013CA
 for <ltp@lists.linux.it>; Tue,  3 Mar 2020 12:55:02 +0100 (CET)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023Brott031229;
 Tue, 3 Mar 2020 11:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=JrSFsyJI0q+VfKf4LzJnfq0mXxZ9NFh+R/4W0IDVI5E=;
 b=LBotIRlGOBu+4HNgjKMuRTjnsWyajjRaj6WCMGbl/r2OLnMqH7jCumI+HjhPbkJ/317O
 4g0+hmUL1TJlV0tMsVxChZbn4md97uPG73ARxVYao4wgo0Ry7aUwu9+oAiJNl57ACqtJ
 24dzNAW0bVuqie9dNGawW1gBJFAdOUmcICgWcywqigAuT3K7/1wlZ2Yr02SsSm9rJPek
 fPbYXvBE8prgJ6CX6Wx06gZdiCTTj0s44+sSnr7gzhGxXHiJWBlJZcvhX0dDgLjXZjTa
 iAxmfJbT0ncIZg331/Fw5MQIbtwmgz4AsXXA3bsSka6vIXQ0DmD7OLdJ8CRNFKn45K0n cQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2yffcues3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 11:55:00 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023Bh7sP082018;
 Tue, 3 Mar 2020 11:54:59 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2yg1gx9mtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 11:54:59 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 023Bss5I021887;
 Tue, 3 Mar 2020 11:54:58 GMT
Received: from ak.ru.oracle.com (/10.162.80.29)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 03 Mar 2020 03:54:53 -0800
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200302155857.923-1-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <91a9db4d-fef8-12f0-d996-87bdb7365b74@oracle.com>
Date: Tue, 3 Mar 2020 14:59:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302155857.923-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030090
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] nfs: Add fsid=PID to exportfs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 02.03.2020 18:58, Petr Vorel wrote:
> Following 0ccbcfc38 ("syscalls/statx07: add fsid= to exports"):
> 
> Not all filesystems are stored on devices, and not all filesystems
> have UUIDs. tmpfs is one of them, which lead to test failing:
> /tmp/XRzHSG/server requires fsid= for NFS export
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi Alexey,
> 
> simple fix, but better to check.
> I'm working on more NFS related fixes.
> 

Agree, thanks Petr!

> Kind regards,
> Petr
> 
>  testcases/network/nfs/nfs_stress/nfs_lib.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> index e4a0c7e27..66f2fb038 100644
> --- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
> +++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
> @@ -48,7 +48,7 @@ get_socket_type()
>  
>  nfs_setup_server()
>  {
> -	local export_cmd="exportfs -i -o no_root_squash,rw *:$remote_dir"
> +	local export_cmd="exportfs -i -o fsid=$$,no_root_squash,rw *:$remote_dir"
>  
>  	if [ -n "$LTP_NETNS" ]; then
>  		if [ ! -d $remote_dir ]; then
> 

Acked-by: Alexey Kodanev <alexey.kodanev@oracle.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
