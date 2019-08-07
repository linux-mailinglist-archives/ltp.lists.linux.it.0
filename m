Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D569A84E66
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Aug 2019 16:16:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 932283C1D3C
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Aug 2019 16:16:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 6AC533C1CF7
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 16:16:51 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 092DF6008F7
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 16:16:52 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x77EEL0F173043;
 Wed, 7 Aug 2019 14:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=5WrVqAvIwZyPfWUx4ylqQnhTJ/3Zzt4//uyiBa13UXQ=;
 b=2IKoA6l3Ekw5hXd5I60O/pk/pOykO2ufHLRL7WQxb7KS4PqiFy7m4XBQIyUvjsDCn/Qu
 1OqO3Sh2qxt82c68hkRAzd+to0L72Icv7qiFAfKv5WsILpHNUIk6IdiShnDJSftZD1Pn
 rpZ9dX5iS7HJ3EIcctTBQ4ax43mpRb+5R7tEldgNeXXbwal9YYfDf478wyQwoAH1SSGN
 tBWT+pW+sFaqG8onk9gpeU2p6tmYE4chvGoGl18nSpRwshnIIS1fPLTx9txQTtdrKGTX
 6K1SfsGgbrWWqmOdp2oYCvbKk6tR0ZM2mJhn89EN8N7MCKiRmlhPPUkdkdHtxVyF/Wer HA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2u527pvjm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Aug 2019 14:16:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x77EDVuK063615;
 Wed, 7 Aug 2019 14:16:48 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2u75780138-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Aug 2019 14:16:48 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x77EGipd010900;
 Wed, 7 Aug 2019 14:16:47 GMT
Received: from [192.168.1.111] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 07 Aug 2019 07:16:44 -0700
To: Petr Vorel <pvorel@suse.cz>, Li Wang <liwang@redhat.com>
References: <20190731063320.4898-1-pvorel@suse.cz>
 <CAEemH2f5XQZw-1hP7ffNYFUtPcBW7TujgkGjN5T0NBa5gnx_AQ@mail.gmail.com>
 <20190731072744.GA9043@x230>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <75d2ba6f-447d-8982-0404-df3100073d5c@oracle.com>
Date: Wed, 7 Aug 2019 17:16:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731072744.GA9043@x230>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9341
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908070152
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9341
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908070152
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] zram01: Fix division by 0
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 31.07.2019 10:27, Petr Vorel wrote:
> Hi Li,
> 
>>> +       if [ $used_mem -eq 0 ]; then
>>> +               tst_resm TBROK "no memory used by zram"
>>> +               return
>>> +       fi
> 
>> Why not use tst_brkm directly? Otherwise looks good to me.
> Make sense.
> Thanks for your ack, lets wait for Alexey.
> 
> I wonder how this can happen (found occasionally on ppc64le).
> 

Is it actually working, i.e. writing to zram?

      while true; do
          dd conv=notrunc if=/dev/zero of=zram${i}/file \
             oflag=append count=1 bs=1024 status=none \
             > /dev/null 2>&1 || break
          b=$(($b + 1))
      done
      tst_resm TINFO "zram$i can be filled with '$b' KB"

Perhaps, we could add a check for the minimum value of $b and print
the last error from dd too...

> If this happen than zram02 and zram03 fails on timeout:
> /opt/ltp/testcases/bin/zram_lib.sh: line 38: echo: write error: Device or resource busy
> zram03      1  TBROK  :  safe_file_ops.c:301: Failed to close FILE '/sys/block/zram0/disksize' at zram03.c:87: errno=EBUSY(16): Device or resource busy
> 
> Maybe some timeout would help, need to look into it.
> 
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
